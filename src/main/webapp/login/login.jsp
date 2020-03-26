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
        
        
        <div class="uk-section uk-section-muted uk-flex uk-flex-middle uk-animation-fade" uk-height-viewport>
	<div class="uk-width-1-1">
		<div class="uk-container">
			<div class="uk-grid-margin uk-grid uk-grid-stack" uk-grid>
				<div class="uk-width-1-1@m">
					<div class="uk-margin uk-width-large uk-margin-auto uk-card uk-card-default uk-card-body uk-box-shadow-large">
						<h3 class="uk-card-title uk-text-center">Welcome back to BookNews!</h3>
						<form action="/CoronaBook/loginHandler" method="post">
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
								<button class="uk-button uk-button-primary uk-button-large uk-width-1-1">Login</button>
							</div>
							<div class="uk-text-small uk-text-center">
								Not registered? <a href="/CoronaBook/login/register.jsp">Create an account</a>
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
