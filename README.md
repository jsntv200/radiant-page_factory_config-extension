# Page Factory Config

This applies the idea of the Default Page Parts extension but uses Page
Factory to create a child page with default fields, parts and layout.


## Installation

The Page Factory extension is requirement but currently doesn't install via
a gem. So from within your Radiant install clone the repo :

```
git clone git://github.com/joshfrench/radiant-page_factory-extension.git vendor/extensions/page_factory
```


Add the gems to your Gemfile :

```
gem "radiant-page_factory-extension", :path => "vendor/extensions"
gem "radiant-page_factory_config-extension", "~> 1.0.0"
```


Update your bundle :

```
$ bundle install
```


## Usage

Add a new page part to the parent page called `factory-config` with the 
`filter` set to none.

Within the factory-config part add a YAML config consisting of the parts, 
fields and layout you'd like to use as defaults. You cam also use remove_parts 
and remove_fields to remove default elements.

```
layout: Default

parts:
  - name: content
    description: "The body page part"
    filter_id: textile

  - name: sidebar
    description: "The sidebar page part"
    filter_id: none

remove_parts:
  - name: body

fields:
  - name: "Sub Title"

remove_fields:
  - name: Description
```


## To Do

- Create some tests
