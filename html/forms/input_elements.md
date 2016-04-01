* input type="email" Defines a field for an e-mail address 

* input type="password" Defines a password field (characters are masked)

* input type="text" Defines a single-line text field

* input type="date"  Defines date control. Year, month, and day. No time.

* input type="checkbox" Defines checkbox

 * form action : The action attribute specifies where to send the form-data when a form is submitted

 * form method :  The method attribute specifies how to send form-data (the form-data is sent to the page specified in the action attribute).

The form-data can be sent as URL variables (with method="get") or as HTTP post transaction (with method="post").

* Notes on GET:

Appends form-data into the URL in name/value pairs
The length of a URL is limited (about 3000 characters)
Never use GET to send sensitive data! (will be visible in the URL)
Useful for form submissions where a user want to bookmark the result
GET is better for non-secure data, like query strings in Google

* Notes on POST:

Appends form-data inside the body of the HTTP request (data is not shown is in URL)
Has no size limitations
Form submissions with POST cannot be bookmarked