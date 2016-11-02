require "rails_helper"

describe "Items" do
  it "returns all items" do
    items_2 = Item.create(
      id: 1,
      name: "Enormous Linen Car",
      description: "Voluptas quia quod hic iste. Harum tempora et faci...",
      image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=...",
      created_at: "2016-11-02 03:59:19", updated_at: "2016-11-02 03:59:19"
    )

  end
end
