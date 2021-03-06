Feature: channel can be deleted

    Scenario: deletion of one channel
        Given I have the following channels in my database:
            | name   | max_size   | created_at          | updated_at          | content_type| id                                   |
            | short  | 140        | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | text/plain  | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |
            | email  | 520        | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | text/plain  | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |
        When I delete "/channels/7ffab230-3d48-4eea-aa2c-22f8680230b6"
        Then the status code should be "204"
        And in the database for the channel "7ffab230-3d48-4eea-aa2c-22f8680230b6" the field "is_visible" should be "False"

    Scenario: deletion of non existing channel fail
        Given I have the following channels in my database:
            | name   | max_size   | created_at          | updated_at          | content_type| id                                   |
            | short  | 140        | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | text/plain  | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |
            | email  | 520        | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | text/plain  | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |
        When I delete "/channels/7ffab240-3d48-4eea-aa2c-22f8680230b6"
        Then the status code should be "404"

    Scenario: deletion of invisible channel fail
        Given I have the following channels in my database:
            | name   | max_size   | created_at          | updated_at          | content_type|is_visible| id                                   |
            | short  | 140        | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | text/plain  |True      | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |
            | email  | 520        | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | text/plain  |False     | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |
        When I delete "/channels/7ffab232-3d48-4eea-aa2c-22f8680230b6"
        Then the status code should be "404"


    Scenario: deletion of one channel
        Given I have the following channels in my database:
            | name   | max_size   | created_at          | updated_at          | content_type|is_visible| id                                   |
            | short  | 140        | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | text/plain  |True      | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |
            | email  | 520        | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | text/plain  |True      | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |
        And I delete "/channels/7ffab230-3d48-4eea-aa2c-22f8680230b6"
        When I get "/channels"
        Then the status code should be "200"
        And the header "Content-Type" should be "application/json"
        And the field "channels" should have a size of 1
        And the field "channels.0.name" should be "email"
        And the field "channels.0.max_size" should be 520

