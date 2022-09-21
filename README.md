# CmClickpost

CmClickpost is a wrapper gem to [clickpost.ai](https://www.clickpost.ai/). Using this gem you can integrate Clickpost's create order API and tracking API to your project seamlessly.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cm_clickpost'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install cm_clickpost

## Usage

### Configuration
You need to create `initializers/cm_clickpost.rb` file and pass the username and API keys provided to you by Clickpost at the time of registration.
```ruby 
CmClickpost.setup([:clickpost_username], [:clickpost_api_key], Rails.env)
```

### Create order with Clickost
To create a forward order with Clickpost you need to use the `Shipment` module provided with this gem. This uses Clickpost's Create Order V3 API. You have to pass the necessary information to create the order. 
You can read the official documentation about this API [here](https://clickpost.github.io/slate/?json#order-creation-v3-api-forward).

#### Pickup address
```ruby
shipment.pickup_address({
            pickup_name: string, 	
            pickup_phone: string,
            pickup_pincode: string,
            pickup_address: string,
            pickup_time: DateTime object in iso8601 format,
            pickup_city: string,	
            pickup_state: string,	
            pickup_country: string,	
            email: string,	
            tin: string
        })
```
#### Drop Address
```ruby
shipment.drop_address({
            drop_address: string,
            drop_phone: string,
            drop_country: string,
            drop_state: string,
            drop_pincode: string,
            drop_city: string,
            drop_name: string,
            drop_email: string
        })
```
#### Order details
```ruby
shipment.order_details({
            height: int (in cm),
            order_type: "COD" or "PREPAID",
            invoice_value: string,
            invoice_number: string,
            invoice_date: string (yyyy-mm-dd),
            reference_number: string,
            length: int (in cm),
            breadth: int (in cm),
            weight: int (in grams),
            courier_partner: int (ID of the courier partner that you want to make the order with),
            cod_value: string (if COD is given as order_type)
        })
```
#### Product details
In case there are multiple products, wrap this in a loop.
```ruby
shipment.product_details({
            product_url: string,
            price: string,
            description: string,
            quantity: string,
            sku: string
        })
```
#### GST Information
```ruby
shipment.gst_info({
            seller_gstin: string,
            taxable_value: string,
            is_seller_registered_under_gst: bool,
            place_of_supply: string,
            hsn_code: string,
            enterprise_gstin: string,
            gst_total_tax: string,
            igst_amount: string,
            cgst_amount: string,
            invoice_reference: string,
        })
```
#### Additional Information
```ruby
shipment.additional_info({
            label: bool,
            gst_number: string,
            account_code: int (account_code is generated when you add a courier partner in clickpost),
            order_id: string
        })
```
#### Return address
```ruby
shipment.return_address({
            name: string, 	
            phone: string,
            pincode: string,
            address: string,
            city: string,	
            state: string,	
            country: string,	
        })
```

After passing these values simply call `create_shipping_order` and the order will be placed.
```ruby 
shipment.create_shipping_order
```

This method will return the response object in JSON format. From this you can extract the waybill, shipping label pdf link etc. Check out the documentation to learn more.

### Order tracking
Clickpost provides order tracking in two ways, polling and using webhooks. Tracking using polling can be done using this gem.

#### Polling
Using `Shipment` Module you can use polling to get the latest tracking information from Clickpost.

```ruby 
CmClickpost::Shipment.track(waybill: string, courier_partner_id: int)
```

This will return the track object. You can learn about the response [here](https://clickpost.github.io/slate/?json#tracking-awb-using-polling).

#### Webhooks
You can use the documentation to use webhooks for real-time tracking. Find about it more [here](https://clickpost.github.io/slate/?json#tracking-awb-using-webhooks).

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/cm_clickpost. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/cm_clickpost/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the CmClickpost project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/cm_clickpost/blob/master/CODE_OF_CONDUCT.md).
