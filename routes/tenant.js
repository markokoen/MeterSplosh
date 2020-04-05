const fs = require('fs');

module.exports = {
    addTenantPage: (req, res) => {
        res.render('register-user.ejs', {
            title: 'Welcome to MeterSplosh | Register'
            , message: ''
        });
    },
    addTenant: (req, res) => {

        let message = '';
        let FullName = req.body.FullName;
        let Email = req.body.Email;
        let Phone = req.body.Phone;
        let MeterID = req.body.MeterID;

        let MeterIDQuery = "SELECT * FROM `Tenants` WHERE MeterID = '" + MeterID + "'";

        db.query(MeterIDQuery, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            if (result.length > 0) {
                message = 'MeterID already Registered';
                res.render('register-user.ejs', {
                    message,
                    title: 'Welcome to MeterSplosh | Register'
                });
            } else {
                // send the Tenant's details to the database
                let query = "INSERT INTO `Tenants` (FullName, Email, MeterID, Phone) VALUES ('" +
                    FullName + "', '" + Email + "', '" + MeterID + "', '" + Phone + "')";
                db.query(query, (err, result) => {
                    if (err) {
                        return res.status(500).send(err);
                    }
                    res.redirect('/');
                });
            }
        });
    },
    editPlayerPage: (req, res) => {
        let playerId = req.params.id;
        let query = "SELECT * FROM `players` WHERE id = '" + playerId + "' ";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.render('edit-player.ejs', {
                title: 'Edit  Player'
                , player: result[0]
                , message: ''
            });
        });
    },
    editPlayer: (req, res) => {
        let playerId = req.params.id;
        let first_name = req.body.first_name;
        let last_name = req.body.last_name;
        let position = req.body.position;
        let number = req.body.number;

        let query = "UPDATE `players` SET `first_name` = '" + first_name + "', `last_name` = '" + last_name + "', `position` = '" + position + "', `number` = '" + number + "' WHERE `players`.`id` = '" + playerId + "'";
        db.query(query, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }
            res.redirect('/');
        });
    },
    deletePlayer: (req, res) => {
        let playerId = req.params.id;
        let getImageQuery = 'SELECT image from `players` WHERE id = "' + playerId + '"';
        let deleteUserQuery = 'DELETE FROM players WHERE id = "' + playerId + '"';

        db.query(getImageQuery, (err, result) => {
            if (err) {
                return res.status(500).send(err);
            }

            let image = result[0].image;

            fs.unlink(`public/assets/img/${image}`, (err) => {
                if (err) {
                    return res.status(500).send(err);
                }
                db.query(deleteUserQuery, (err, result) => {
                    if (err) {
                        return res.status(500).send(err);
                    }
                    res.redirect('/');
                });
            });
        });
    }
};