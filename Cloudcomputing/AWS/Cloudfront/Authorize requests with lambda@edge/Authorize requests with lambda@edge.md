Create a lambda function for lambda@edge in us-east-1

Name the file index.js and upload the whole folder with the nodemodules with the vscode extention or as zip file.

Dont forget to change the JWT_SECRET value:

```javascript
const jwt = require('jsonwebtoken');

const JWT_SECRET = "test";

exports.handler = async (event) => {
    const request = event.Records[0].cf.request;
    const querystring = request.querystring;

    function parseQueryString(query) {
        const params = {};
        if (query) {
            const pairs = query.split('&');
            for (let i = 0; i < pairs.length; i++) {
                const pair = pairs[i];
                const indexOfEqual = pair.indexOf('=');
                if (indexOfEqual !== -1) {
                    const key = pair.substring(0, indexOfEqual);
                    const value = pair.substring(indexOfEqual + 1);
                    try {
                        params[key] = decodeURIComponent(value);
                    } catch (error) {
                        throw error;
                    }
                } else {
                    throw new Error('Invalid query string format');
                }
            }
        }
        return params;
    }
    
    try {
        const params = parseQueryString(querystring);
        const token = params['stream_token'];

        if (!token) {
            const response = {
                status: '401',
                statusDescription: 'Unauthorized',
                body: 'Unauthorized: JWT missing',
            };
            return response;
        }

        try {
            jwt.verify(token, JWT_SECRET);

        } catch (jwtError) {
            const response = {
                status: '401',
                statusDescription: 'Unauthorized',
                body: 'Unauthorized: JWT invalid',
            };
            return response;
        }
    } catch (error) {
        const response = {
            status: '401',
            statusDescription: 'Unauthorized',
            body: 'Unauthorized: JWT missing or invalid',
        };
        return response;
    }

    return request;
};

```
