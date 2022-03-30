<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>S-L</title>
        <link rel="stylesheet" href="registration.css">
    </head>
    
    <body>
        
        <div class="contanier">

            <div class="left">
                
                <h1 class="title">SignUp to our Store ...</h1>
                <form method="POST" action="signup.php">

                    <div class="t">
                        <label>First Name</label><br>
                        <input type="text" name="first-name">
                    </div>

                    <div class="t">
                        <label>Last Name</label><br>
                        <input type="text" name="last-name">
                    </div>

                    <div class="">
                        <label>Your Email</label><br>
                        <input type="email" class="full-width" name="email">
                    </div>

                    <div class="t">
                        <label>Your Mobile</label><br>
                        <input type="text" name="phone">
                    </div>

                    <div class="t">
                        <label>Date of bitrh</label><br>
                        <input type="date" name="date-of-birth" >
                    </div>

                    <div class="t">
                        <label>Password</label><br>
                        <input type="password" name="password">
                    </div>

                    <div class="t">
                    <label>Confirm Password</label><br>
                    <input type="password" name="confirm-password">
                    </div>
                    
                    <div class="">
                        <label>Choose Your City : &nbsp; &nbsp;</label>
                        <select name="city" id="">

                            <option value="">Choose</option>
                            <option value="a">a</option>
                            <option value="b">b</option>
                            <option value="c">c</option>
                            <option value="d">d</option>
                            <option value="e">e</option>

                        </select>
                    </div>

                    <div class="">
                        <label> Your Address with more details</label> <br>
                        <input type="text" class="full-width" name="address" >   
                    </div>

                    <input type="submit" class="sign-btn" value="Create">

                </form>
            </div>


            <div class="right">
                <h1 class="title">Welcome back !</h1> 

                <form method="POST" action="login.php">

                    <div class=""> 
                        <label>Your Email</label><br>
                        <input type="email" class="full-width b-gray" name="email" id="">
                    </div>

                   <div class="">
                    <label>Password</label><br>
                    <input type="password" class="full-width b-gray" name="password" id="">
                   </div>
                    
                    <input type="submit" class="login-btn " value="Login" >
                    
                </form>
            </div>

            <div class="clear-fix"></div>

                
        </div>
    </body>

    </html>