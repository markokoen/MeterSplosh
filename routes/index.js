module.exports = {
    getHomePage: (req, res) => {
        let query = "SELECT * FROM `Tenants` ORDER BY TenantID ASC"; // query database to get all the Tenants

        // execute query
        db.query(query, (err, result) => {
            if (err) {
                res.redirect('/');
            }
            res.render('index.ejs', {
                title: 'Welcome to Metersplosh | View Tenants'
                ,tenants: result
            });
        });
    },
};