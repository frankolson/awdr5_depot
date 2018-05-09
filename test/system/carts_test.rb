require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase
  test "cart is revealed when it has items" do
    visit store_index_url

    assert_no_selector 'h2', text: 'Your Cart'

    first('.catalog li').click_on 'Add to Cart'

    assert_selector 'h2', text: 'Your Cart'
  end

  test "cart is hidden when it has no items" do
    visit store_index_url

    first('.catalog li').click_on 'Add to Cart'

    assert_selector 'h2', text: 'Your Cart'

    accept_alert do
      click_on 'Empty cart'
    end

    assert_no_selector 'h2', text: 'Your Cart'
  end

  test "product is highlighted when added to the cart" do
    visit store_index_url

    assert_no_selector 'tr.line-item-highlight'

    first('.catalog li').click_on 'Add to Cart'

    assert_selector 'tr.line-item-highlight'
  end
end
