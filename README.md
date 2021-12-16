# FIDELITY PLAN

Is inspired in [Spoleto Fidelidade](https://www.spoleto.com.br/fidelidade?utm_source=&utm_medium=SMSSPOL0073&utm_campaign=NOVOS&utm_content=CADASTRO_FIDELIDADE), 
a system which book customers orders counting it aiming 
giving back some benefits for those who are recurring in the restaurant.

I went to a good restaurant in the Mall. On there, the attendant asked me my
phone number in order to sign me up.
After months, I decided to sign up as well. However my number is already on the 
system so I had to claim my account with my phone number.

Both things caught my attention, the good food and the way I signed up on it, 
like customizing the Devise Authentication.

## Whatsapp Chat bot

One way to manage restaurant customers is via whatsapp.

It is hard to accountability the restaurant customers orders in order to
apply some benefits in their favor.

So this is the reason it has been including on this version 
The ability to the chat bot using the restaurant data for interactions
with the customers.

For details of changing between releases take a look on the
release list.

# Start the Project in your own machine

## Clone it

1. Using SSH: `git clone git@github.com:Pauloparakleto/fidelity-plan.git`


2. Using HTTPS: `git clone https://github.com/Pauloparakleto/fidelity-plan.git`

## Bundle it

On terminal run: `bundle install`

## PostgreSQL Staff

[I don't have postgre locally on my Ubuntu Machine](https://help.ubuntu.com/community/PostgreSQL). Follow the instruction
on the link and come back to the instructions bellow.

1. Rename the file `database.sample.yml` to `database.yml`, `config/local_env.sample.yml`
to `local_env.yml`.
2. Set the password on the default area according to your password, mine is `12345`
3. Set the username on the default area to your role with privilege to create database.
   Mine is the default role. So I comment out the username line in order
   to postgre reach the name of my machine.
4. Start database server: `sudo service postgresql start`.

## Connect Rails to the database

Run: `rails db:create db:migrate`

Populate the database with initial data: `rails db:seed`.

The admin is on there, email: `admin@fidelity-plan.com`
complex password: `123456`.

## Run the server
Run: `rails webpacker:install`

Run: `rails server`

## Testing it

Run the tests: `rspec`. And don't worry about the whatsapp fails.
It needs the twilio credential.

The pipeline here has this credential. You may give attention to the others tests. 

If some tests fail with webpack misses configuration warnings, run: `rails webpacker:install`

## Contributing

The twilio just have a real credential to use so it spends
the free money credit.

If you have a way to mock it like the CSV staff I would be thankful.

[Create your own twilio key](https://www.twilio.com/) or contribute building another feature.
The project area has some issues you may like to give a try.

If in anyway you want to go ahead in the whatsapp robot library, take a look at the
`config/local_env.yml`.
Follow exactly the same structure. The `application.rb` loads the local environments in a
non nested structure.

You may check the [full database relationship diagram](https://github.com/Pauloparakleto/fidelity-plan/wiki/The-Database-Relationship) for
this present release on the wiki page 

Should I say more? Keep the pipeline green and avoid headache.

[![Rails Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop-rails)

[![Rails Style Guide](https://img.shields.io/badge/code_style-community-brightgreen.svg)](https://rails.rubystyle.guide)
