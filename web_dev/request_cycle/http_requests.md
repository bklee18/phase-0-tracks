2. What are some common HTTP status codes?
- 200 OK: the standard response for successful HTTP requests for both GET and POST methods.
- 404 Not Found: the requested resource could not be found
- 403 Forbidden: the user is unauthorized to access the requested resource
- 504 Gateway Timeout: server timed out because did not get a timely response from an upstream server.

3. What is the difference between a GET request and a POST request? When might each be used?
- A GET request is used when a user makes a request to view or access a resource. 
- A POST request is used when the user submits data to be processed by the server.

4. Optional bonus question: What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?
- Cookies are data stored in a user's web browser whenever they visit the site that stored the cookie. Each time the user requests access to the site, the cookie is transmitted to the server with any information the server told the cookie to store (like browsing history, authenication, etc)