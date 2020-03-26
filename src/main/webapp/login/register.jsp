<%-- 
    Document   : login
    Created on : 20.03.2020, 15:05:48
    Author     : Michael ADAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/css/uikit.min.css" /> 
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/js/uikit.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/uikit@3.3.1/dist/js/uikit-icons.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


        <title>JSP Page</title>
    </head>
    <body>
        <script>
            <%
                String error = (String) request.getSession().getAttribute("error");
                if (error != null) {
                    out.print("UIkit.notification({message: '" + error + "', status: 'warning'})");
                }
            %>
        </script>
        <script>

            // Function to check Whether both passwords 
            // is same or not. 
            function checkPassword(form) {
                password1 = form.password1.value;
                password2 = form.password2.value;
 
                if (password1 === '')
                    UIkit.notification({message: 'Please enter Password', status: 'warning'});
                else if (password2 === '')
                    UIkit.notification({message: 'Please enter confirm password', status: 'warning'});
                else if (password1 !== = password2) {
                    UIkit.notification({message: 'Password did not match: Please try again...', status: 'warning'});
                } else {
                    UIkit.notification({message: 'Sending data!', status: 'success'}); 
                    return true;
                }
                return true;
            }
        </script> 

        <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
            <div class="uk-width-1-1">
                <div class="uk-container">
                    <div class="uk-grid-margin uk-grid uk-grid-stack" uk-grid>
                        <div class="uk-width-1-1@m">
                            <div class="uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
                                <h3 class="uk-card-title uk-text-center">Welcome to BookNews!</h3>
                                <form onSubmit = "return checkPassword(this)" action="/CoronaBook/registrationHandler" method="post">
                                    <div class="uk-margin">
                                        <div class="uk-inline uk-width-1-1">
                                            <span class="uk-form-icon" uk-icon="icon: mail"></span>
                                            <input class="uk-input uk-form-large" type="email" name="email" placeholder="example@examp.le">
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <div class="uk-inline uk-width-1-1">
                                            <span class="uk-form-icon" uk-icon="icon: user"></span>
                                            <input class="uk-input uk-form-large" type="text" name="username" placeholder="username">
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <div class="uk-inline uk-width-1-1">
                                            <span class="uk-form-icon" uk-icon="icon: lock"></span>
                                            <input class="uk-input uk-form-large" type="password" name="password" placeholder="password">	
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <div class="uk-inline uk-width-1-1">
                                            <span class="uk-form-icon" uk-icon="icon: lock"></span>
                                            <input class="uk-input uk-form-large" type="password" name="password2" placeholder="repeat password">	
                                        </div>
                                    </div>
                                    <div class="uk-margin">
                                        <button class="uk-button uk-button-primary uk-button-large uk-width-1-1">Registrate</button>
                                    </div>
                                    <div class="uk-text-small uk-text-center">
                                        Already registered? <a href="/CoronaBook/login/login.jsp">login</a>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
