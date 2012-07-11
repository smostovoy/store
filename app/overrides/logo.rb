#Deface::Override.new(
#    :virtual_path => 'orders/_form',
#    #:virtual_path => 'orders/edit',
#                     :name => 'add_order_info_to_layout',
#                     :insert_bottom => "div",
##:original => '18cdbeb8417795b55983aba84ee193395077a12f',
#                     :text => "
#                     <h1 id='sdf'>sdfdf</h1>
#                      <script type='text/javascript' >
#                      var granifyShopCart = <%= granify_cart_info %>
#                      </script>
#                      "
#                      )
Deface::Override.new(:virtual_path => "layouts/spree_application",
                     :name => "logo",
                     :replace_contents => "#logo",
                     :text => "Store")