const functions = require('firebase-functions');
const admin = require('firebase-admin');

admin.initializeApp();

exports.deteleUserByEmail = functions.https.onRequest(async (request, response) => {
	const userEmail = request.body.userEmail;

	admin.auth().getUserByEmail(userEmail)
			.then(userRecord => {
				const uid = userRecord.uid
				return admin.auth().deleteUser(uid)
			})
			.then(() => {
				console.log("Successfully deteled user.")
				response.status(200).send("Deleted User")
				return
			})
			.catch(error => {
				console.log("Error deleting user:", error)
				response.status(500).send("Failed")
			})
})
