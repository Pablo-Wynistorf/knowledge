First of all create the cloudfront function:

Use cloudfront-js-2.0 and give it a name.

Then add the js code:

```javascript
function handler(event) {
    const request = event.request;
    const uri = request.uri;
    
    const rawHeaderValue = uri.split('/')[1];
    const headerValue = rawHeaderValue.split('?')[0];
    
    request.headers['x-path'] = { value: headerValue }
    
    request.uri = uri.replace('/' + headerValue, '');
    
    if (request.uri === '') {
        request.uri = '/'
    }
    
    return request;
}
```



Save the changes and publish the function.

Then you only have to associate it with the proper distribution on the viewer request



IMPORTANT:

Create a custom origin request policy, with the correct headers that are included in the request. In this case the x-server header.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/preload/1oKNDGJQVsEWs42NoXADL4UO.png)

Create it and associate it in the **Behaviors** tab under **Origin request policy name**:

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/preload/n4YDXWGW3qshQ5LUp_btrbRU.png)







On f.e. a ALB you can then create a listener with the rules. In the rules section, add a condition for if it matches http header.

![](https://slabstatic.com/prod/uploads/ptzfq7y2/posts/images/preload/HIBrWPGz_HmuhhMFdfUEAFlq.png)

And then rout it to the wanted target.
