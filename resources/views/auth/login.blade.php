<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Login Template</title>
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"> 
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.8.95/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="{{asset('assets/front/css/login.css')}}">
</head>
<body>
  <main class="col-md-12">
    <div class="">
      <div class="card login-card">
        <div class="row no-gutters">
          <div class="col-md-8">
            <div class="login-card-img col-md-12">
              <div class="row">
                <div class="col-md-3">
                <marquee behavior="scroll" direction="up" scrollamount="10">
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
              </marquee>
              </div>
              <div class="col-md-3">
                <marquee behavior="scroll" direction="down" scrollamount="10">
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
              </marquee>
              </div>
              <div class="col-md-3">
                <marquee behavior="scroll" direction="up" scrollamount="10">
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
              </marquee>
              </div>
              <div class="col-md-3">
                <marquee behavior="scroll" direction="down" scrollamount="10">
                    <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                    <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                    <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                    <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                    <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                    <img src="assets/front/images/bp.png" width="250" height="680" alt="Natural" />
                </marquee>
              </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card-body">
              <div class="brand-wrapper">
                <!-- <img src="assets/images/logo.svg" alt="logo" class="logo"> -->
                <h3 class=""><b>B.Shot</b></h3>

              </div>
              <form action="{{ route('login') }}" method="POST">
                @csrf

                <ul class="nav nav-tabs" id="myTab" role="tablist">
                  <li class="nav-item">
                    <a class="nav-link active" id="login-tab" data-toggle="tab" href="#login" role="tab" aria-controls="login" aria-selected="true">Log In</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" id="signup-tab" data-toggle="tab" href="#signup" role="tab" aria-controls="signup" aria-selected="false">Sign Up</a>
                  </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                  <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                    

                  <div class="form-group mt-2">
                    <label for="email" class="sr-only">{{ __('E-Mail Address') }}</label>
                    <input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror" placeholder="Email address" value="{{ old('email') }}" required autocomplete="email" autofocus>
                    @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                  </div>
                  <div class="form-group mb-4">
                    <label for="password" class="sr-only">{{ __('Password') }}</label>
                    <input type="password" name="password" id="password" class="form-control @error('password') is-invalid @enderror" placeholder="***********" required autocomplete="current-password">
                     @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                  </div>
                  <button type="submit" class="btn btn-block login-btn mb-4">{{ __('Login') }}</button>
                   </form>
                  </div>
                  <div class="tab-pane fade" id="signup" role="tabpanel" aria-labelledby="signup-tab">
                     <form method="POST" action="{{ route('register') }}">
                        @csrf
                           <div class="form-group row mt-2">
                            
                              <div class="col-md-6">
                                <label for="email" class="sr-only">{{ __('Name') }}</label>
                              <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" placeholder="First name" autofocus>
                              @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                              </div>
                              <div class="col-md-6">
                                <label for="email" class="sr-only">{{ __('Name') }}</label>
                              <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" placeholder="Last name" autofocus>
                              @error('name')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                              </div>
                              
                            </div>
                             <div class="form-group">
                              <label for="email" class="sr-only">{{ __('E-Mail Address') }}</label>
                              <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="Email" style="margin-top: -18px;">
                              @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group mb-4">
                              <label for="password" class="sr-only">{{ __('Password') }}</label>

                              <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Password">
                             @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="form-group">
                              <label for="password-confirm" class="sr-only">{{ __('Confirm Password') }}</label>

                              <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Confirm Password">
                             @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <input type="checkbox" id="checkme" name="checkme" value="Terms & condition and Privacy policy" required>
                            <label for="vehicle1"><a href="{{url('/terms&conditions')}}">Terms & condition  </a>and <a href="{{url('/privacy')}}"> Privacy policy</a></label>
                            <button type="submit" class="btn btn-block login-btn mb-4" id="sendNewSms">{{ __('Sign Up') }}</button>
                            <!-- <input type="submit" id="submit_sign" value="Submit" disabled /> -->

                    </form>
                  </div>
                </div>
                  <hr class="hr-text text-center" data-content="Or" style="margin-top: -10px; " />
                  <button class="loginBtn loginBtn-facebook"><img src="https://img.icons8.com/fluent/48/000000/facebook-new.png" width="40" height="40" style="float: left">{{ __('Facebook') }}</button>
                  <button class="loginBtn loginBtn-google mt-2"><img src="https://img.icons8.com/color/48/000000/google-logo.png" width="40" height="40" style="float: left">{{ __('Google') }}</button>

               
<!-- 

                @if (Route::has('password.request'))
                                    <a  href="{{ route('password.request') }}" class="forgot-password-link">
                                        {{ __('Forgot Your Password?') }}
                                    </a>
                                @endif
                <p class="login-card-footer-text">Don't have an account? <a href="{{url('register')}}" class="text-reset">Register here</a></p> -->
                <!-- <nav class="login-card-footer-nav">
                  <a href="#!">Terms of use.</a>
                  <a href="#!">Privacy policy</a>
                </nav> -->
            </div>
          </div>
        </div>
      </div>
     
    </div>
  </main>
  <script src="https://kit.fontawesome.com/1b4177d91c.js" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
 <!--  <script type="text/javascript">
    $('#checkme').click(function() {
  if ($(this).is(':checked')) {
    $('#submit_sign').removeAttr('disabled');
  } else {
    $('#submit_sign').attr('disabled', 'disabled');
  }
});
  </script> -->
</body>
</html>
