<?php echo $header; ?>
<div class="master-wrapper-content">
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
            <div class="page category-page">
                <div class="page-title">
                    <h1><?php echo $heading_title; ?></h1>
                </div>
                <div class="page-body">
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
                            <select id="input-limit" class="productsPageSizeDropDown" onchange="location = this.value;">
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
                            <?php foreach ($products as $p => $product) { ?>
                            <div class="item-box">
                                <div class="product-item">
                                    <script>
                                        var specialpage<?php echo $product['product_id']; ?> = {
                                            id:'<?php echo $product['product_id']; ?>',
                                            name:'<?php echo $product['name']; ?>',
                                            model: '<?php echo $product['model']; ?>',
                                            sku: '<?php echo $product['sku']; ?>',
                                            category: '<?php echo $product['category']; ?>',
                                            brand: '<?php echo $product['manufacturer']; ?>',
                                            position: <?php echo $p; ?>
                                        }
                                    </script>
                                    <div class="picture"><a onclick="GaListLink(specialpage<?php echo $product['product_id']; ?>, GaList.SpecialPage); return false;"
                                                    href="<?php echo $product['href']; ?>"><img
                                                    src="<?php echo $product['thumb']; ?>"
                                                    alt="<?php echo $product['name']; ?>"
                                                    title="<?php echo $product['name']; ?>" class="img-responsive"/></a>
                                    </div>
                                    <div class="details">
                                        <div class="product-rating-box">
                                            <div class="rating">
                                                <?php for ($i = 1; $i <= 5; $i++) { ?>
                                                <?php if ($product['rating'] < $i) { ?>
                                                <span class="fa fa-stack"><i
                                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                                <?php } else { ?>
                                                <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i
                                                            class="fa fa-star-o fa-stack-2x"></i></span>
                                                <?php } ?>
                                                <?php } ?>
                                            </div>
                                        </div>
                                        <h2 class="product-title"><a onclick="GaListLink(specialpage<?php echo $product['product_id']; ?>, GaList.SpecialPage); return false;"
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
                                                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                                                <?php } ?>
                                            </div>
                                            <?php } ?>
                                            <div class="description"><?php echo $product['description']; ?></div>
                                            <div class="buttons-upper">
                                                <input class="button-2 add-to-wishlist-button" type="button"
                                                       data-toggle="tooltip"
                                                       title="<?php echo $button_wishlist; ?>"
                                                       onclick="GaListAddToWishlist(specialpage<?php echo $product['product_id']; ?>, GaList.SpecialPage)"/>
                                                <input class="button-2 add-to-compare-list-button" type="button"
                                                       data-toggle="tooltip"
                                                       title="<?php echo $button_compare; ?>"
                                                       onclick="GaListAddToCompare(specialpage<?php echo $product['product_id']; ?>, GaList.SpecialPage);"/>
                                            </div>
                                            <div class="buttons-lower">
                                                <div class="ajax-cart-button-wrapper">
                                                    <input id="productQuantity<?php echo $product['product_id']; ?>"
                                                           type="text" class="productQuantityTextBox"
                                                           value="<?php echo $product['minimum']; ?>">
                                                    <button class="button-2 product-box-add-to-cart-button"
                                                            type="button"
                                                            onclick="GaListAddToCart(specialpage<?php echo $product['product_id']; ?>, GaList.SpecialPage, $('#productQuantity<?php echo $product['product_id']; ?>').val());">
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
                            <?php echo $results; ?>
                        </div>
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
                                    'list': GaList.SpecialPage,
                                    'position': <?php echo $p; ?>
                                });
                                <?php } ?>

                                ga('send', 'event', 'Ecommerce', 'Impression', GaList.SpecialPage, {'nonInteraction': 1});
                            }
                        </script>
                    </div>
                    <?php } else { ?>
                    <div class="no-data"><?php echo $text_empty; ?></div>
                    <div class="buttons">
                        <a href="<?php echo $continue; ?>" class="button-1"><?php echo $button_continue; ?></a>
                    </div>
                    <?php } ?>
                </div>
            </div>
            <?php echo $content_bottom; ?>
        </div>
        <?php echo $column_right; ?>
    </div>
</div>
<?php echo $footer; ?>