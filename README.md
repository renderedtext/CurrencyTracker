CurrencyTracker
===============

CurrencyTracker allows you to track your personal collection of world currencies, by tagging the countries that you've visited along your travels.

Features
--------

* Track Visited Countries
* Track Collected Currencies
* Charts show you how far along you are!

Changes
=======
* Multi - tenant app

  I used `devise` gem as a de-facto standard authentication solution for Rails 3.
  
  I created the additional table where I store visited/collected countries/currencies.
  
  This table has `country_id` and `currency_id` relation keys for country and currency and `user_id` for user relation.
  
  So I can create new entry in this table for every currency and country for logged user.
  
  I create index on `user_id` for fast select queries for logged user.
  
  Maybe it was my mistake to don't split this table on two tables, because requests for visited countries and collected currencies must be different. But as I understand every country has only one currency so it's not mistake in the current case.
  
* Additional Table Features
  
  I used `jquery-rails` gem. This gem provide remote events for links and forms in Rails application with additional hooks for jQuery.

  So Visit/Collect buttons sends remote POST request and after execute callbacks on success AJAX requests.

  I made small changes to pie chart initialization for storing pie chart object inside data of DOM element. It is very easy for small objects. For bigger objects better to use HTML5 storage or AJAX request.

  For filter feature I used `scoped_search` gem. This gem provide very simple and understandable way to do search. Filter form use AJAX requests to avoid page reloading.
  
* Additional Charting Features

 I copied simple pie chart and made small changes to support line charts. It's ugly.
 

 Too much time was spend on read docs for Google Chart API and understand how it works. Just now I think what better to use any charts jQuery plugins for charts.

 If I will have more time I can make tests for AJAX requests and for new model. I can rewrite charts to use someone chart JS library to better chart render/update, etc.
 