
@extends('front.layouts.master')
@section('content')
    <div class="col-md-9">
        <div class="row">
            <div class="col-md-3" style="padding: 0px;">

                <img src="assets/front/images/bp.png" width="100%" height="780" alt="Natural" />

            </div>
            <div class="col-md-3" style="padding: 0px;">

                <img src="assets/front/images/bp.png" width="100%" height="780" alt="Natural" />

            </div>
            <div class="col-md-3" style="padding: 0px;">

                <img src="assets/front/images/bp.png" width="100%" height="780" alt="Natural" />

            </div>
            <div class="col-md-3" style="padding: 0px;">

                <img src="assets/front/images/bp.png" width="100%" height="780" alt="Natural" />

            </div>
        </div>
    </div>
    <div class="col-md-3">
        <nav id="myTab" class="nav nav-tabs nav-justified">
            <a class="nav-item nav-link active bg-primary"
               data-toggle="tab" href="#home">LOGIN</a>
            <a class="nav-item nav-link bg-success"
               data-toggle="tab" href="#menu2">SIGNUP</a>

            <a class="nav-item nav-link disabled" data-toggle="tab" href="#menu3"></a>
        </nav>
        <div class="tab-content" style="overflow-y: hidden;">
            <div id="home" class="tab-pane active">
                <h3 class="">
                    <b>B.Shot</b>
                </h3>


                <div class="card">
                    <div class="card-body">
                        <form action="{{ route('login') }}" method="POST">
                            @csrf
                            <div class="form-group mt-2">
                                <label for="email">Email</label>
                                <input type="email" name="email" id="email" class="form-control @error('email') is-invalid @enderror" placeholder="Email address" value="{{ old('email') }}" required autocomplete="email" autofocus>
                                @error('email')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" class="form-control @error('password') is-invalid @enderror" placeholder="***********" required autocomplete="current-password">
                                @error('password')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                            <button style="background: #0098D3; color:#ffffff" type="submit" class="btn btn-block login-btn mb-4">LOGIN</button>
                        </form>

                        <a href="{{ url('/auth/redirect/facebook') }}" style="width:100%; background: #2450AF;color:#ffffff;" class="btn btn-success"><img src="https://img.icons8.com/fluent/48/000000/facebook-new.png" width="40" height="30"> Facebook</a>
                        <a href="{{ url('/auth/redirect/google') }}" style="margin-top:5px; width:100%; background: #e7e7e7;color:#000000;" class="btn btn-success"><img src="https://img.icons8.com/color/48/000000/google-logo.png" width="40" height="30"> Google </a>


                    </div>
                </div>
            </div>
            <div id="menu2" class="tab-pane fade">
                <div class="card">
                    <div class="card-body">
                        <form method="POST" action="{{ route('register') }}">
                            @csrf


                            <div class="row">   
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>First Name</label>
                                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" placeholder="First name" autofocus>
                                        @error('name')

                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror

                                    </div>
                                </div>


                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Last Name</label>
                                        <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" placeholder="Last name" autofocus>
                                        @error('name')

                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror


                                    </div>
                                </div>
                            </div>




                            <div class="form-group">
                                <label for="email">{{ __('E-Mail Address') }}</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" placeholder="Email">
                                @error('email')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                            <div class="form-group">
                                <label for="password">{{ __('Password') }}</label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password" placeholder="Password">
                                @error('password')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror

                            </div>
                            <div class="form-group">
                                <label for="password-confirm">{{ __('Confirm Password') }}</label>
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password" placeholder="Confirm Password">
                                @error('password')

                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                                @enderror
                            </div>
                            <input type="checkbox" id="checkme" name="checkme" value="Terms & condition and Privacy policy" required>
                            <label for="vehicle1"><a href="{{url('/terms&conditions')}}">Terms & condition  </a>and <a href="{{url('/privacy')}}"> Privacy policy</a></label>
                            <button style="background: #0098D3; color:#ffffff" type="submit" class="btn btn-block login-btn mb-4" id="sendNewSms">{{ __('Sign Up') }}</button>
                            <!-- <input type="submit" id="submit_sign" value="Submit" disabled /> -->
                        </form>
                    </div>
                </div>
            </div>
            <div id="menu1" class="tab-pane fade"></div>
            <div id="menu3" class="tab-pane fade"></div>
        </div>
    </div>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script>
$(document).ready(function () {
$('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
localStorage.setItem('activeTab', $(e.target).attr('href'));
});
var activeTab = localStorage.getItem('activeTab');
if (activeTab) {
$('#myTab a[href="' + activeTab + '"]').tab('show');
}
});
</script>
@endsection