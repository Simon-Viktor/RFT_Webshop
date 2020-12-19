if (process.env.NODE_ENV != 'production') {
    require('dotenv').config()
}

var port = process.env.PORT || 1337;

const express = require('express')
const app = express()
const passport = require('passport')
const flash = require('express-flash')
const session = require('express-session')
const methodOverride = require('method-override')
const dotenv = require('dotenv').config()

const initPP = require('./passport-config')
initPP(
    passport,
    email => users.find(user => user.email === email), //TODO later replace this function with a db call
    id => users.find(user => user.id === id) //TODO later replace this function with a db call
)


//TODO - Placeholder array following for temporary storing of user data; Later shift that over to databases when those are implemented.
const users = [];

app.set('view-engine', 'ejs')
app.use(express.urlencoded({ extended: false }))
app.use(flash())
app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false
}))
app.use(passport.initialize())
app.use(passport.session())
app.use(methodOverride('_method'))

app.get('/', (req, res) => {
    if (req.user) {
        res.render('index.ejs', { name: req.user.name })
    } else {
        res.render('index.ejs')
    }
    //TODO - Potentially add in the elements required here to draw the entire thing.
});

app.get('/login', checkAuth, (req, res) => {
    res.render('login.ejs')
});
app.post('/login', checkAuth, passport.authenticate('local', {
    successRedirect: '/',
    failureRedirect: '/login',
    failureFlash: true
}));

app.delete('/logout', checkNotAuth, (req, res) => {
    req.logOut()
    res.redirect('/')
})

app.get('/register', checkAuth, (req, res) => {
    res.render('register.ejs')
});
app.post('/register', checkAuth, async (req, res) => {
    try {
        //TODO - placeholder for DB interactions
        users.push({
            id: Date.now().toString(),
            name: req.body.name,
            email: req.body.email,
            password: req.body.password
        });

        res.redirect('/login');
        console.log("Redirecting to login")
    } catch (e) {
        res.redirect('/register');
        console.log(e)
    }
    console.log(users);
});

app.get('/cart', checkNotAuth, (req, res) => {
    res.render('cart.ejs')
});

app.listen(port);


function checkAuth(req, res, next) {
    if (req.isAuthenticated()) {
        return res.redirect('/')
    }
    next()
}
function checkNotAuth(req, res, next) {
    if (req.isAuthenticated()) {
        return next()
    }
    res.redirect('/login')
}