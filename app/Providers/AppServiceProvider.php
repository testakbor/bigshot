<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);
        //category for front end
		
		 $categories=DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy','product_cat')
        ->where('terms.status',1)
        ->select('term_taxonomy.*','terms.name','terms.status')
        ->orderBy('term_taxonomy.term_taxonomy_id','desc')
        ->limit(13)->get();
        view()->share('categories',$categories);

        $banner=DB::table('posts')
        ->where('post_type','banner')
        ->join('postmeta','posts.ID','=','postmeta.post_id')
        ->first();
        view()->share('banner',$banner);

        $tags = DB::table('term_taxonomy')
        ->join('terms', 'terms.term_id', '=', 'term_taxonomy.term_id')
        ->where('term_taxonomy.taxonomy', 'product_tag')
        ->select('term_taxonomy.*', 'terms.name', 'terms.status')
        ->get();
        view()->share('tags', $tags);
    }
}
