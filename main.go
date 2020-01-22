package main

import (
	"context"
	"database/sql"
	"fmt"
	"html/template"
	"log"
	"net/http"
	"strconv"

	_ "github.com/go-sql-driver/mysql"
	"github.com/gorilla/sessions"
	_ "github.com/gorilla/sessions"
)

var (
	ctx context.Context
	db  *sql.DB
)

type data struct {
	H1Title string
	ImgBg   string
	IsAdmin bool
	FName   string
	IsLogin bool
	UserID  int
	Items   [][]string
}

var (
	// key must be 16, 24 or 32 bytes long (AES-128, AES-192 or AES-256)
	key   = []byte("super-secret-key")
	store = sessions.NewCookieStore(key)
)

func check(err error) {
	if err != nil {
		log.Fatal(err)
	}
}
func getData(w http.ResponseWriter, r *http.Request) data {
	fName := ""
	isAdmin := false
	isLogin := false
	var userID int
	var ok bool
	var d data
	session, err := store.Get(r, "authenticated-user-session")
	check(err)
	if isLogin, ok = session.Values["authenticated"].(bool); !ok || !isLogin {
		//http.Error(w, "Forbidden", http.StatusForbidden)
		d = data{"", "", false, "", false, 0, nil}
		return d
	}
	if fName, ok = session.Values["firstname"].(string); !ok {
		fmt.Println("Gagal Mendapatkan Nama User")
	}
	fmt.Println("Login sebagai", fName)
	if isAdmin, ok = session.Values["admin"].(bool); !ok {
		fmt.Println("Gagal Mendapatkan user status Admin")
	}
	if userID, ok = session.Values["userid"].(int); !ok {
		fmt.Println("Gagal Mendapatkan user Id")
	}
	d = data{"", "", isAdmin, fName, isLogin, userID, nil}
	return d
}

func home(w http.ResponseWriter, r *http.Request) {
	d := getData(w, r)
	d.H1Title = "Home"
	d.ImgBg = "home"
	sqlnya := `SELECT A.Judul,A.Isi,B.FirstName,A.PublishDate FROM Artikel A LEFT JOIN User B 
				ON A.UserID = B.Id WHERE A.PublishDate IS NOT NULL ORDER BY A.PublishDate DESC LIMIT 10`
	rows, err := db.Query(sqlnya)
	if err != nil {
		log.Fatal(err)
	}
	defer rows.Close()
	for rows.Next() {
		var judul, isi, fName, publishDate string

		if err := rows.Scan(&judul, &isi, &fName, &publishDate); err != nil {
			// Check for a scan error.
			// Query rows will be closed with defer.
			log.Fatal(err)
		}
		d.Items = append(d.Items, []string{judul, isi, fName, publishDate})
	}
	loadTemplate("{{template \"page-home\" .}}", d, w, r)

}

func homeDef(w http.ResponseWriter, r *http.Request) {
	http.Redirect(w, r, "/home", http.StatusFound)
}

func about(w http.ResponseWriter, r *http.Request) {
	d := getData(w, r)
	d.H1Title = "About Me"
	d.ImgBg = "about"
	loadTemplate("{{template \"page-about\" .}}", d, w, r)

}

func post(w http.ResponseWriter, r *http.Request) {
	d := getData(w, r)
	d.H1Title = "Article"
	d.ImgBg = "post"
	if !d.IsLogin {
		http.Redirect(w, r, "/home", http.StatusFound)
		return
	}
	if r.Method == "GET" {
		sqlnya := `SELECT A.Id, A.Judul,B.FirstName,A.CreateDate,IFNULL(A.PublishDate,"") 
		FROM Artikel A LEFT JOIN User B ON A.UserID = B.Id WHERE A.UserId=?
		ORDER BY A.CreateDate DESC`
		rows, err := db.Query(sqlnya, d.UserID)
		if err != nil {
			log.Fatal(err)
		}
		defer rows.Close()
		i := 1
		for rows.Next() {
			var aID, judul, fName, createDate, publishDate string

			if err := rows.Scan(&aID, &judul, &fName, &createDate, &publishDate); err != nil {
				// Check for a scan error.
				// Query rows will be closed with defer.
				log.Fatal(err)
			}
			s1 := strconv.Itoa(i)
			i++
			d.Items = append(d.Items, []string{s1, judul, fName, createDate, publishDate, aID})
		}
		loadTemplate("{{template \"page-post\" .}}", d, w, r)
	} else {
		r.ParseForm()
		sqlnya := "UPDATE `Artikel` SET PublishDate = NULL WHERE Id=?"
		if r.FormValue("B1") == "Publish" {
			sqlnya = "UPDATE `Artikel` SET PublishDate = NOW() WHERE Id=?"
		}
		stmt, err := db.Prepare(sqlnya)
		check(err)
		fmt.Println(sqlnya)
		_, err = stmt.Exec(r.FormValue("aId"))
		check(err)
		http.Redirect(w, r, "/post", http.StatusFound)
	}

}

func newPost(w http.ResponseWriter, r *http.Request) {
	d := getData(w, r)
	d.H1Title = "New Article"
	d.ImgBg = "post"
	if !d.IsLogin {
		http.Redirect(w, r, "/home", http.StatusFound)
		return
	}
	if r.Method == "GET" {
		loadTemplate("{{template \"page-newpost\" .}}", d, w, r)
	} else {
		r.ParseForm()
		stmt, err := db.Prepare("insert into `Artikel` (Judul,Isi,CreateDate,UserID) VALUES (?,?,NOW(),?)")
		check(err)
		//fmt.Println(r.Form["inputEmail"])
		_, err = stmt.Exec(r.FormValue("title"), r.FormValue("message"), d.UserID)
		check(err)
		//http.Redirect(w, r, "/post", http.StatusFound)
	}

}

func contact(w http.ResponseWriter, r *http.Request) {
	d := getData(w, r)
	d.H1Title = "Contact Me"
	d.ImgBg = "contact"
	fmt.Println("contact")
	if r.Method == "GET" {
		fmt.Println("contact1")
		loadTemplate("{{template \"page-contact\" .}}", d, w, r)
	} else {
		fmt.Println("contact2")
		r.ParseForm()
		stmt, err := db.Prepare("insert into `Message` (Name,Email,Phone,Msg,CreateDate) VALUES (?,?,?,?,NOW())")
		check(err)
		//fmt.Println(r.Form["inputEmail"])
		_, err = stmt.Exec(r.FormValue("name"), r.FormValue("email"), r.FormValue("phone"), r.FormValue("message"))
		check(err)
		//http.Redirect(w, r, "/contact", http.StatusFound)
	}

}

func login(w http.ResponseWriter, r *http.Request) {
	if r.Method == "GET" {
		d := data{"Login", "login", false, "", false, 0, nil}
		loadTemplate("{{template \"page-login\" .}}", d, w, r)
	} else {
		//var userName string
		var fName string
		//var pass string
		var userID int
		loginFail := true
		r.ParseForm()
		userName := r.FormValue("username")
		pass := r.FormValue("inputPassword")
		fmt.Println("Data Input Login [", userName, pass, "]")
		row := db.QueryRow("SELECT Id,FirstName,UserName,Password FROM User WHERE UserName=?", userName)
		switch err := row.Scan(&userID, &fName, &userName, &pass); err {
		case sql.ErrNoRows:
			fmt.Println("No Rows were returned!")
			loginFail = true
		case nil:
			fmt.Println("data user", userName, fName, pass, userID)
			if r.FormValue("inputPassword") == pass && r.FormValue("username") == userName {
				loginFail = false
			}
		default:
			check(err)
		}
		if loginFail {
			http.Redirect(w, r, "/login", http.StatusFound)
		} else {
			session, err := store.Get(r, "authenticated-user-session")
			check(err)
			session.Values["userid"] = userID
			session.Values["username"] = userName
			session.Values["firstname"] = fName
			session.Values["authenticated"] = true
			fmt.Println(userName, fName, pass, userID)
			fmt.Println("Masuk")
			err = session.Save(r, w)
			check(err)
			http.Redirect(w, r, "/home", http.StatusFound)

		}
	}

}

func logout(w http.ResponseWriter, r *http.Request) {
	fmt.Println("masuk fungsi logout")
	session, err := store.Get(r, "authenticated-user-session")
	check(err)
	session.Values["authenticated"] = false
	session.Save(r, w)
	http.Redirect(w, r, "/home", http.StatusFound)
}

func loginCheck(w http.ResponseWriter, r *http.Request) bool {
	session, err := store.Get(r, "authenticated-user-session")
	check(err)
	if auth, ok := session.Values["authenticated"].(bool); !ok || !auth {
		//http.Error(w, "Forbidden", http.StatusForbidden)
		return false
	}
	return true
}
func user(w http.ResponseWriter, r *http.Request) {
	d := getData(w, r)
	d.H1Title = "Login"
	d.ImgBg = "login"
	loadTemplate("{{template \"page-login\" .}}", d, w, r)

}

func register(w http.ResponseWriter, r *http.Request) {
	if r.Method == "GET" {
		d := data{"Register", "register", false, "", false, 0, nil}
		loadTemplate("{{template \"page-register\" .}}", d, w, r)
	} else {
		r.ParseForm()
		stmt, err := db.Prepare("insert into `User` (username,firstname,lastname,password,status) VALUES (?,?,?,?,?)")
		check(err)
		//fmt.Println(r.Form["inputEmail"])
		_, err = stmt.Exec(r.FormValue("inputEmail"), r.FormValue("firstName"), r.FormValue("lastName"), r.FormValue("inputPassword"), 1)
		check(err)
		http.Redirect(w, r, "/login", http.StatusFound)
	}

}

func loadTemplate(tmpl string, d data, w http.ResponseWriter, r *http.Request) {
	t, err := template.ParseGlob("./template/*.html")
	check(err)

	t, err = t.Parse(tmpl)
	check(err)

	/*data := struct {
		Title string
	}{
		Title: "My page 2",
	}
	data.Title = titleHeader*/
	err = t.Execute(w, d)
	check(err)
}

func main() {
	fs := http.FileServer(http.Dir("./template"))
	http.Handle("/", http.StripPrefix("/", fs))

	// Open up our database connection.
	// I've set up a database on my local machine using phpmyadmin.
	// The database is called testDb
	var err1 error
	db, err1 = sql.Open("mysql", "hacktiv8:Test123456@tcp(127.0.0.1:3306)/testGolang")

	// if there is an error opening the connection, handle it
	if err1 != nil {
		panic(err1.Error())
	}

	// defer the close till after the main function has finished
	// executing
	defer db.Close()

	http.HandleFunc("/login", login)         // set router
	http.HandleFunc("/logout", logout)       // set router
	http.HandleFunc("/register", register)   // set router
	http.HandleFunc("/home", home)           // set router
	http.HandleFunc("/about", about)         // set router
	http.HandleFunc("/newpost", newPost)     // set router
	http.HandleFunc("/post", post)           // set router
	http.HandleFunc("/contact", contact)     // set router
	err := http.ListenAndServe(":9090", nil) // set listen port
	if err != nil {
		log.Fatal("Error running service: ", err)
	}
}
