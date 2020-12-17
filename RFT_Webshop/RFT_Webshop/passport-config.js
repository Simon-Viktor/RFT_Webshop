const LocalStrat = require('passport-local').Strategy;


function initializePP(pass, userByEmail, userByID) {
    const authUser = (email, pwd, done) => {
        const user = userByEmail(email);
        if (user == null) {
            return done(null, false, { message: 'No user with that email' })
        }
        try {
            if (pwd == user.password) {
                return done(null, user);
            } else {
                return done(null, false, { message: 'Incorrect password' })
            }
        } catch (e) {
            return done(e);
        }
    }

    pass.use(new LocalStrat({ usernameField: 'email' }, authUser));

    pass.serializeUser((user, done) => done(null, user.id))
    pass.deserializeUser((id, done) => {
        return done(null, userByID(id))
    })
}

module.exports = initializePP;