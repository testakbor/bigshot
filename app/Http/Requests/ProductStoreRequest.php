<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ProductStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'post_title' => 'required',
            'post_content' => 'required',
            'regular_price' => 'required',
            'sale_price' => 'required',
            'product_stock' => 'required',
            'post_excerpt' => 'required',
            'category' => 'required',
            'tag' => 'required',
            // 'product_brand' => 'required',
            'product_image' => 'required',
            'galleryImage' => 'required',
        ];
    }
    /**
     * Get the validation custom message that apply to the view.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'post_title.required'           => 'Please enter product name',
            'post_content.required'         => 'Please enter product description',
            'regular_price.required'        => 'Please enter regular price',
            'sale_price.required'           => 'Please enter sale price',
            'product_stock.required'        => 'Please enter cost',
            'post_excerpt.required'         => 'Please enter short description',
            'category.required'             => 'Please select category',
            // 'product_brand.required'        => 'Please select brand',
            'product_image.required'        => 'Please select product image',
            'galleryImage.required'         => 'Please select product gallery',
        ];
    }

}
