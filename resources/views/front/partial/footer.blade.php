<section class="footer">
  

<!-- footer -->

<label for="show-foot" class="toggle" ><a href="#" style="font-size: 15px;">Contact, Terms, Policies & More</a></label>
<div id="target">
  <ul class="footNavUL">
            <li><a href="#">Customer Support</a></li>
            <li><a href="#">Help/FAQ</a></li>
            <li><a href="#">Press</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Careers</a></li>
            <li><a href="#">Privacy Policy</a></li>
            <li><a href="#">Accessibility Statement</a></li>
            <li><a href="#">Tax Policy</a></li>
            <li><a href="#">Terms of Use</a></li>
            <li><a href="#">Return Policy</a></li>
            <li><a href="#">Sell on Wish</a></li>
            <li><a href="#">Intellectual Property</a></li>
            <li><a href="#">Categories</a></li>
          </ul>
</div>

<!-- end footer -->
</section>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="{{asset('assets/front/js/bootstrap.min.js')}}"></script>
    <script src="{{asset('assets/front/js/main.js')}}"></script>
    <script src="{{asset('assets/front/js/jquery.steps.js')}}"></script>
    <script type="text/javascript">
    (function($) {
  $(".wrapper .more").click(function(show) {
    var showMe = $(this)
      .closest(".product")
      .find(".container-prod");
    $(this)
      .closest(".wrapper")
      .find(".container-prod")
      .not(showMe)
      .removeClass("information");
    $(".container-prod").removeClass("social-sharing");
    showMe
      .stop(false, true)
      .toggleClass("information")
      .removeClass("social-sharing");
    show.preventDefault();
  });

  $(".wrapper .share").click(function(share) {
    var showMe = $(this)
      .closest(".product")
      .find(".container-prod");
    $(this)
      .closest(".wrapper")
      .find(".container-prod")
      .not(showMe)
      .removeClass("social-sharing");
    $(".container-prod").removeClass("information");
    showMe
      .stop(false, true)
      .toggleClass("social-sharing")
      .removeClass("information");
    share.preventDefault();
  });

  $(".wrapper .add").click(function(share) {
    var showMe = $(this)
      .closest(".product")
      .find(".cart");
    showMe.stop(false, true).addClass("added");
    var showMe = $(this)
      .closest(".product")
      .find(".container-prod");
    showMe
      .stop(false, true)
      .removeClass("social-sharing")
      .removeClass("information");
    share.preventDefault();
  });
})(jQuery);


    $('.Show').click(function() {
    $('#target').show(10000);
    $('.Show').hide(0);
    $('.Hide').show(0);
});
$('.Hide').click(function() {
    $('#target').hide(10000);
    $('.Show').show(0);
    $('.Hide').hide(0);
});
$('.toggle').click(function() {
    $('#target').toggle('slow');
});



    </script>
  </body>
</html>