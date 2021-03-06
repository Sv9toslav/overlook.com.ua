<?php echo $header; ?>
    <div class="master-wrapper-content"">
    <div class="breadcrumb">
        <ul>
            <?php foreach ($breadcrumbs as $cnt => $breadcrumb) { ?>
                <?php if ($cnt + 1 < count($breadcrumbs)) { ?>
                    <li>
                        <a href="<?php echo $breadcrumb['href']; ?>">
                            <span><?php echo $breadcrumb['text']; ?></span>
                        </a>
                        <span class="delimiter">/</span>
                    </li>
                <?php } else { ?>
                    <li>
                        <strong class="current-item"><?php echo $breadcrumb['text']; ?></strong>
                    </li>
                <?php } ?>
            <?php } ?>
        </ul>
    </div>
    <div class="master-column-wrapper">
        <?php echo $column_left; ?>
        <?php if ($column_left && $column_right) { ?>
            <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
            <?php $class = 'center-2'; ?>
        <?php } else { ?>
            <?php $class = 'center-1'; ?>
        <?php } ?>
        <div id="content" class="<?php echo $class; ?>">
            <?php echo $content_top; ?>
            <div class="page search-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
                    <div class="search-input">
                        <div class="fieldset">
                            <div class="form-fields">
                                <div class="basic-search">
                                    <div class="inputs">
                                        <label for="input-search"><?php echo $entry_search; ?></label>
                                        <input type="text" name="search" value="<?php echo $search; ?>" id="input-search"
                                               class="search-text valid"/>
                                    </div>
                                    <div class="inputs reversed">
                                        <input checked="checked" id="adv" name="adv" type="checkbox" value="true"><input name="adv" type="hidden" value="false">
                                        <label for="adv">Advanced search</label>
                                    </div>
                                </div>
                                    <div class="advanced-search">
                                        <div class="inputs">
                                            <label><?php echo $text_select_category; ?></label>
                                            <select name="category_id">
                                                <option value="0"><?php echo $text_category; ?></option>
                                                <?php foreach ($categories as $category_1) { ?>
                                                    <?php if ($category_1['category_id'] == $category_id) { ?>
                                                        <option value="<?php echo $category_1['category_id']; ?>"
                                                                selected="selected"><?php echo $category_1['name']; ?></option>
                                                    <?php } else { ?>
                                                        <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
                                                    <?php } ?>
                                                    <?php foreach ($category_1['children'] as $category_2) { ?>
                                                        <?php if ($category_2['category_id'] == $category_id) { ?>
                                                            <option value="<?php echo $category_2['category_id']; ?>"
                                                                    selected="selected">
                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
                                                        <?php } else { ?>
                                                            <option value="<?php echo $category_2['category_id']; ?>"><?php echo $category_1['name']; ?>
                                                                >> <?php echo $category_2['name']; ?></option>
                                                        <?php } ?>
                                                        <?php foreach ($category_2['children'] as $category_3) { ?>
                                                            <?php if ($category_3['category_id'] == $category_id) { ?>
                                                                <option value="<?php echo $category_3['category_id']; ?>"
                                                                        selected="selected">
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
                                                            <?php } else { ?>
                                                                <option value="<?php echo $category_3['category_id']; ?>"><?php echo $category_1['name']; ?>
                                                                    >> <?php echo $category_2['name']; ?>
                                                                    >> <?php echo $category_3['name']; ?></option>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    <?php } ?>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <div class="inputs">
                                            <?php if ($sub_category) { ?>
                                                <input id="sub_category" type="checkbox" name="sub_category" value="1"
                                                       checked="checked"/>
                                            <?php } else { ?>
                                                <input id="sub_category" type="checkbox" name="sub_category" value="1"/>
                                            <?php } ?>
                                            <label for="sub_category"><?php echo $text_sub_category; ?></label>
                                        </div>
                                        <div class="inputs">
                                            <?php if ($description) { ?>
                                                <input id="description" type="checkbox" name="description" value="1"
                                                       id="description"
                                                       checked="checked"/>
                                            <?php } else { ?>
                                                <input id="description" type="checkbox" name="description" value="1"
                                                       id="description"/>
                                            <?php } ?>
                                            <label for="description"><?php echo $entry_description; ?></label>
                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="buttons">
                            <input type="button" value="<?php echo $button_search; ?>" id="button-search"
                                   class="button-1 search-button"/>
                        </div>
                    </div>
                    <?php if ($products) { ?>
                        <div class="product-selectors">
                            <div class="product-viewmode">
                                <a type="button" id="list-view" class="viewmode-icon list" data-toggle="tooltip"
                                   title="<?php echo $button_list; ?>"></a>
                                <a type="button" id="grid-view" class="viewmode-icon grid" data-toggle="tooltip"
                                   title="<?php echo $button_grid; ?>"></a>
                            </div>
                            <div class="product-sorting">
                                <span><?php echo $text_sort; ?></span>
                                <select id="input-sort" class="sortOptionsDropDown" onchange="location = this.value;">
                                    <?php foreach ($sorts as $sorts) { ?>
                                        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                                            <option value="<?php echo $sorts['href']; ?>"
                                                    selected="selected"><?php echo $sorts['text']; ?></option>
                                        <?php } else { ?>
                                            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>
                            <div class="product-page-size">
                                <span><?php echo $text_limit; ?></span>
                                <select id="input-limit" class="productsPageSizeDropDown"
                                        onchange="location = this.value;">
                                    <?php foreach ($limits as $limits) { ?>
                                        <?php if ($limits['value'] == $limit) { ?>
                                            <option value="<?php echo $limits['href']; ?>"
                                                    selected="selected"><?php echo $limits['text']; ?></option>
                                        <?php } else { ?>
                                            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                                        <?php } ?>
                                    <?php } ?>
                                </select>
                            </div>
                        </div>
                        <div class="product-grid">
                            <div class="item-grid">
                                <?php foreach ($products as  $p => $product) { ?>
                                    <div class="item-box">
                                        <div class="product-item">
                                            <script>
                                                var search<?php echo $product['product_id']; ?> = {
                                                    id:'<?php echo $product['product_id']; ?>',
                                                    name:'<?php echo $product['name']; ?>',
                                                    model: '<?php echo $product['model']; ?>',
                                                    sku: '<?php echo $product['sku']; ?>',
                                                    category: '<?php echo $product['category']; ?>',
                                                    brand: '<?php echo $product['manufacturer']; ?>',
                                                    position: <?php echo $p; ?>
                                                }
                                            </script>
                                            <div class="picture"><a onclick="GaListLink(search<?php echo $product['product_id']; ?>, GaList.SearchResult); return false;"
                                                            href="<?php echo $product['href']; ?>"><img
                                                            src="<?php echo $product['thumb']; ?>"
                                                            alt="<?php echo $product['name']; ?>"
                                                            title="<?php echo $product['name']; ?>"
                                                            class="img-responsive"/></a></div>
                                            <div class="details">
                                                <div class="product-rating-box">
                                                    <div class="rating">
                                                        <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                            <?php if ($product['rating'] < $i) { ?>
                                                                <span class="fa fa-stack"><i
                                                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                                            <?php } else { ?>
                                                                <span class="fa fa-stack"><i
                                                                            class="fa fa-star fa-stack-2x"></i><i
                                                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                                            <?php } ?>
                                                        <?php } ?>
                                                    </div>
                                                </div>
                                                <h2 class="product-title"><a onclick="GaListLink(search<?php echo $product['product_id']; ?>, GaList.SearchResult); return false;"
                                                            href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                                </h2>
                                                <div class="add-info">
                                                    <?php if ($product['price']) { ?>
                                                        <div class="prices">
                                                            <?php if (!$product['special']) { ?>
                                                                <span class="price actual-price"><?php echo $product['price']; ?></span>
                                                            <?php } else { ?>
                                                                <span class="price actual-price"><?php echo $product['special']; ?></span>
                                                                <span class="price old-price"><?php echo $product['price']; ?></span>
                                                            <?php } ?>
                                                            <?php if ($product['tax']) { ?>
                                                                <span class="price-tax"><?php echo $text_tax; ?><?php echo $product['tax']; ?></span>
                                                            <?php } ?>
                                                        </div>
                                                    <?php } ?>
                                                    <div class="description"><?php echo $product['description']; ?></div>
                                                    <div class="buttons-upper">
                                                        <input class="button-2 add-to-wishlist-button" type="button"
                                                               data-toggle="tooltip"
                                                               title="<?php echo $button_wishlist; ?>"
                                                               onclick="GaListAddToWishlist(search<?php echo $product['product_id']; ?>, GaList.SearchResult)"/>
                                                        <input class="button-2 add-to-compare-list-button" type="button"
                                                               data-toggle="tooltip"
                                                               title="<?php echo $button_compare; ?>"
                                                               onclick="GaListAddToCompare(search<?php echo $product['product_id']; ?>, GaList.SearchResult);"/>
                                                    </div>
                                                    <div class="buttons-lower">
                                                        <div class="ajax-cart-button-wrapper">
                                                            <input id="productQuantity<?php echo $product['product_id']; ?>"
                                                                   type="text" class="productQuantityTextBox"
                                                                   value="<?php echo $product['minimum']; ?>">
                                                            <button class="button-2 product-box-add-to-cart-button"
                                                                    type="button"
                                                                    onclick="GaListAddToCart(search<?php echo $product['product_id']; ?>, GaList.SearchResult, $('#productQuantity<?php echo $product['product_id']; ?>').val());">
                                                                <span><?php echo $button_cart; ?></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <?php } ?>
                            </div>
                            <div class="pager">
                                <?php echo $pagination; ?>
                                <p><?php echo $results; ?></p>
                            </div>
                            <?php if ($products) { ?>
                                <script>
                                    if (typeof ga != 'undefined') {
                                        <?php foreach ($products as $p => $product) { ?>
                                        ga('ec:addImpression', {
                                            'id': '<?php echo $product['product_id']; ?>',
                                            'name': '<?php echo $product['name']; ?>',
                                            'model': '<?php echo $product['model']; ?>',
                                            'sku': '<?php echo $product['sku']; ?>',
                                            'category': '<?php echo $product['category']; ?>',
                                            'brand': '<?php echo $product['manufacturer']; ?>',
                                            'list': GaList.SearchResult,
                                            'position': <?php echo $p; ?>
                                        });
                                        <?php } ?>
                                        ga('send', 'event', 'Ecommerce', 'Impression', GaList.SearchResult, {'nonInteraction': 1});
                                    }
                                </script>
                            <?php } ?>
                        </div>
                    <?php } else { ?>
                        <p><?php echo $text_empty; ?></p>
                    <?php } ?>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
    </div>
    <script type="text/javascript"><!--
        $('#button-search').bind('click', function () {
            url = 'index.php?route=product/search';

            var search = $('#content input[name=\'search\']').prop('value');

            if (search) {
                url += '&search=' + encodeURIComponent(search);
            }

            var category_id = $('#content select[name=\'category_id\']').prop('value');

            if (category_id > 0) {
                url += '&category_id=' + encodeURIComponent(category_id);
            }

            var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

            if (sub_category) {
                url += '&sub_category=true';
            }

            var filter_description = $('#content input[name=\'description\']:checked').prop('value');

            if (filter_description) {
                url += '&description=true';
            }
            location = url;
        });

        $('#content input[name=\'search\']').bind('keydown', function (e) {
            if (e.keyCode == 13) {
                $('#button-search').trigger('click');
            }
        });

        $('select[name=\'category_id\']').on('change', function () {
            if (this.value == '0') {
                $('input[name=\'sub_category\']').prop('disabled', true);
            } else {
                $('input[name=\'sub_category\']').prop('disabled', false);
            }
        });

        $('select[name=\'category_id\']').trigger('change');
        --></script>
<?php echo $footer; ?>