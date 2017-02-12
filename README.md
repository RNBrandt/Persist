# README
![Persist](/app/assets/images/persist-logo.png)

# Persist

In a time of increased civic engagement Persist aims to be your one-stop-shop for sharing the positive change you'd like to see in the world with those who've been elected to represent your interests.  It is time let those we've put in power know how we feel.

Show politicians from all levels from citywide all the way up to the president what you want, and the way you'd like them to vote.

### The Team
* [Camille Villa](https://www.linkedin.com/in/camillevilla)
* [Reuben Brandt](https://www.linkedin.com/in/reubenbrandt)
* [Megan Heskett](https://www.linkedin.com/in/maheskett)
* [Don Lang](https://www.linkedin.com/in/donaldlang2)

### Requirements
* Rails 5.0.1
* Civic Responsibility

Add the following to your .env file.
```ruby
DOCUSIGN_API =          'YourIntegratorKey'
DOCUSIGN_USERNAME =     'YourUserName/Email'
DOCUSIGN_PASSWORD =     'YourPassword'
DOCUSIGN_ACCOUNT_ID =   'YourAccountID'
GOOGLE_CIVIC_API_KEY =  'YourGoogleKey'
```
For the Docusign API info make a developer account and check out their docs [here](https://www.docusign.com/developer-center).
For the Google Civic Information API checkout their docs [here](https://developers.google.com/civic-information/).

### Technologies used to make this:

 * [Docusign API](https://www.docusign.com/developer-center) for signature verification
 * [Google Civic  Information API](https://developers.google.com/civic-information/) for the divisions the voters are constituants in
 * [Rails 5.0.1](https://github.com/rails/rails) for the delightful backend
 * [PostreSQL](https://www.postgresql.org/) for the database

 ### License
 Persist is released under the [MIT License](https://opensource.org/licenses/MIT).
