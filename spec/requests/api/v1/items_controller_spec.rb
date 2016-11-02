require "rails_helper"

describe "Items" do
  it "returns all items" do
    item_1 = Item.create(
    id: 1,
    name: "Enormous Linen Car",
    description: "Voluptas quia quod hic iste. Harum tempora et faci...",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=...",
    created_at: "2016-11-02 03:59:19", updated_at: "2016-11-02 03:59:19"
    )

    item_2 = Item.create(
    id: 2,
    name: "Rustic Linen Hat",
    description: "Eum ipsa libero at expedita deserunt. Autem ut quo...",
    image_url: "http://robohash.org/499.png?set=set2&bgset=bg1&siz...",
    created_at: "2016-11-02 03:59:20",
    updated_at: "2016-11-02 03:59:20"
    )

    # When I send a GET request to `/api/v1/items`
    get '/api/v1/items'
    items = JSON.parse(response.body)
    first_item = items.first
    last_item = items.last
    # I receive a 200 JSON response containing all items
    expect(response).to be_success
    # And each item has an id, name, description, and image_url but not the created_at or updated_at
    expect(first_item['id']).to eq(1)
    expect(first_item['name']).to eq('Enormous Linen Car')
    expect(first_item['description']).to eq("Voluptas quia quod hic iste. Harum tempora et faci...")
    expect(first_item['image_url']).to eq("http://robohash.org/0.png?set=set2&bgset=bg1&size=...")
    expect(first_item['created_at']).to eq(nil)
    expect(first_item['created_at']).to eq(nil)

    expect(last_item['id']).to eq(2)
    expect(last_item['name']).to eq('Rustic Linen Hat')
    expect(last_item['description']).to eq("Eum ipsa libero at expedita deserunt. Autem ut quo...")
    expect(last_item['image_url']).to eq("http://robohash.org/499.png?set=set2&bgset=bg1&siz...")
    expect(last_item['created_at']).to eq(nil)
    expect(last_item['created_at']).to eq(nil)
  end

  it "returns all items" do
    item_1 = Item.create(
    id: 1,
    name: "Enormous Linen Car",
    description: "Voluptas quia quod hic iste. Harum tempora et faci...",
    image_url: "http://robohash.org/0.png?set=set2&bgset=bg1&size=...",
    created_at: "2016-11-02 03:59:19", updated_at: "2016-11-02 03:59:19"
    )

    item_2 = Item.create(
    id: 2,
    name: "Rustic Linen Hat",
    description: "Eum ipsa libero at expedita deserunt. Autem ut quo...",
    image_url: "http://robohash.org/499.png?set=set2&bgset=bg1&siz...",
    created_at: "2016-11-02 03:59:20",
    updated_at: "2016-11-02 03:59:20"
    )

    # When I send a GET request to `/api/v1/items/1`
    get '/api/v1/items/1'
    item = JSON.parse(response.body)
    # I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
    expect(response).to be_success

    expect(item['id']).to eq(1)
    expect(item['name']).to eq('Enormous Linen Car')
    expect(item['description']).to eq("Voluptas quia quod hic iste. Harum tempora et faci...")
  end

  it "can create an item" do
    item_params = {name: "Rustic Linen Hat",
      description: "Eum ipsa libero at expedita deserunt. Autem ut quo...",
      image_url: "http://robohash.org/499.png?set=set2&bgset=bg1&siz..."
    }

    post "/api/v1/items", item: item_params
    item = Item.last

    expect(response.status).to eq(201)
    expect(item['name']).to eq("Rustic Linen Hat")
    expect(item['description']).to eq("Eum ipsa libero at expedita deserunt. Autem ut quo...")
    expect(item['image_url']).to eq("http://robohash.org/499.png?set=set2&bgset=bg1&siz...")
  end
end
