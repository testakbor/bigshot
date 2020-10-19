<?php 


public function render($request, Exception $exception)
{
    if ($exception instanceof \Spatie\Permission\Exceptions\UnauthorizedException) {
        return response()->json(['User have not permission for this page access.']);
    }
 
    return parent::render($request, $exception);
}

?>