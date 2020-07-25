** data was taken from [kaggle Datasets](https://www.kaggle.com/mkechinov/ecommerce-behavior-data-from-multi-category-store)
# About
This file contains behavior data for two months (October and November 2019) from a large multi-category online store.

Each row in the file represents an event. All events are related to products and users. Each event is like many-to-many relation between products and users.

Note: if this dataset is too large for you, you can try smaller dataset from cosmetics store.

There are different types of events. See below.

Semantics (or how to read it):

User userid during session usersession added to shopping cart (property eventtype is equal cart) product productid of brand brand of category categorycode (categorycode) with price price at event_time

# More datasets
Due to Kaggle's limit to max 20Gb of files per dataset, I can' upload more data to this dataset. Here you can find additional archives (Dec 2019 and Jan 2020).

# File structure
__event_time__

Time when event happened at (in UTC).

__event_type__

Events can be:

view - a user viewed a product
cart - a user added a product to shopping cart
removefromcart - a user removed a product from shopping cart
purchase - a user purchased a product
Typical funnel: view => cart => purchase.

__product_id__

ID of a product

__category_id__

Product's category ID

__category_code__

Product's category taxonomy (code name) if it was possible to make it. Usually present for meaningful categories and skipped for different kinds of accessories.

__brand__

Downcased string of brand name. Can be missed.

__price__

Float price of a product. Present.

__user_id__

Permanent user ID.

__user_session__

Temporary user's session ID. Same for each user's session. Is changed every time user come back to online store from a long pause.

# Multiple purchases per session
A session can have multiple purchase events. It's ok, because it's a single order.

# Many thanks
Thanks to [REES46 Marketing Platform](https://rees46.com/) for this dataset.

# Using datasets in your works, books, education materials
You can use this dataset for free. Just mention the source of it: link to this page and link to REES46 Marketing Platform.