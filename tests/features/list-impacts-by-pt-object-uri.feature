Feature: list impacts by ptobject and/or uri(s)

    Scenario: Use uri filter to display impacts
        Given I have the following disruptions in my database:
            | reference | note  | created_at          | updated_at          | status    | id                                   |
            | foo       | hello | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | published | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following severities in my database:
                | wording   | color   | created_at          | updated_at          | is_visible | id                                   |
                | good news | #654321 | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | True       | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following impacts in my database:
            | created_at          | updated_at          | status    | id                                   | disruption_id                        |severity_id                          |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b1 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b3 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b4 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following ptobject in my database:
            | type      | uri                    | created_at          | updated_at          | id                                         |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 1ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 2ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 3ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 4ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 5ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 6ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | stop_area | stop_area:JDR:SA:CHVIN | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 7ffab232-3d48-4eea-aa2c-22f8680230b6       |

        Given I have the relation associate_impact_pt_object in my database:
            | pt_object_id                               | impact_id                            |
            | 1ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |
            | 2ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 3ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 4ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |
            | 5ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |
            | 6ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |
            | 7ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |

        Given I have the following applicationperiods in my database:
            | created_at          | updated_at          |id                                   | impact_id                            |start_date                           |end_date            |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b1 | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab234-3d49-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b3 | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b4 | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b5 | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |


        When I get "/impacts?uri[]=network:JDR:1&start_date=2013-12-02T23:52:12Z&end_date=2014-05-21T23:52:12Z"
        Then the status code should be "200"
        And the header "Content-Type" should be "application/json"
        And the field "objects" should have a size of 1
        And the field "objects.0.impacts" should have a size of 3

    Scenario: Use uris filter to display impacts
        Given I have the following disruptions in my database:
            | reference | note  | created_at          | updated_at          | status    | id                                   |
            | foo       | hello | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | published | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following severities in my database:
                | wording   | color   | created_at          | updated_at          | is_visible | id                                   |
                | good news | #654321 | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | True       | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following impacts in my database:
            | created_at          | updated_at          | status    | id                                   | disruption_id                        |severity_id                          |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b1 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b3 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b4 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following ptobject in my database:
            | type      | uri                    | created_at          | updated_at          | id                                         |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 1ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 2ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 3ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 4ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 5ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 6ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | stop_area | stop_area:JDR:SA:CHVIN | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 7ffab232-3d48-4eea-aa2c-22f8680230b6       |

        Given I have the relation associate_impact_pt_object in my database:
            | pt_object_id                                                     | impact_id                            |
            | 1ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |
            | 2ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 3ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 4ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |
            | 5ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |
            | 6ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |
            | 7ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |

        Given I have the following applicationperiods in my database:
            | created_at          | updated_at          |id                                   | impact_id                            |start_date                           |end_date            |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b1 | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab234-3d49-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b3 | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b4 | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b5 | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |


        When I get "/impacts?uri[]=network:JDR:1&uri[]=network:JDR:2&start_date=2013-12-02T23:52:12Z&end_date=2014-05-21T23:52:12Z"
        Then the status code should be "200"
        And the header "Content-Type" should be "application/json"
        And the field "objects" should have a size of 2
        And the field "objects.0.impacts" should have a size of 3
        And the field "objects.1.impacts" should have a size of 3

    Scenario: Use uri and pt_object_type filter to display impacts
        Given I have the following disruptions in my database:
            | reference | note  | created_at          | updated_at          | status    | id                                   |
            | foo       | hello | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | published | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following severities in my database:
                | wording   | color   | created_at          | updated_at          | is_visible | id                                   |
                | good news | #654321 | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | True       | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following impacts in my database:
            | created_at          | updated_at          | status    | id                                   | disruption_id                        |severity_id                          |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b1 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b3 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b4 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following ptobject in my database:
            | type      | uri                    | created_at          | updated_at          | id                                         |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 1ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 2ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 3ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 4ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 5ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 6ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | stop_area | stop_area:JDR:SA:CHVIN | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 7ffab232-3d48-4eea-aa2c-22f8680230b6       |

        Given I have the relation associate_impact_pt_object in my database:
            | pt_object_id                               | impact_id                            |
            | 1ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |
            | 2ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 3ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 4ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |
            | 5ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |
            | 6ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |
            | 7ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |

        Given I have the following applicationperiods in my database:
            | created_at          | updated_at          |id                                   | impact_id                            |start_date                           |end_date            |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b1 | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab234-3d49-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b3 | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b4 | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b5 | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |


        When I get "/impacts?pt_object_type=network&uri[]=network:JDR:1&start_date=2013-12-02T23:52:12Z&end_date=2014-05-21T23:52:12Z"
        Then the status code should be "200"
        And the header "Content-Type" should be "application/json"
        And the field "objects" should have a size of 1
        And the field "objects.0.impacts" should have a size of 3

    Scenario: Use uris and pt_object_type filter to display impacts
        Given I have the following disruptions in my database:
            | reference | note  | created_at          | updated_at          | status    | id                                   |
            | foo       | hello | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | published | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following severities in my database:
                | wording   | color   | created_at          | updated_at          | is_visible | id                                   |
                | good news | #654321 | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | True       | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following impacts in my database:
            | created_at          | updated_at          | status    | id                                   | disruption_id                        |severity_id                          |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b1 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b3 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b4 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following ptobject in my database:
            | type      | uri                    | created_at          | updated_at          | id                                         |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 1ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 2ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 3ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 4ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 5ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 6ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | stop_area | stop_area:JDR:SA:CHVIN | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 7ffab232-3d48-4eea-aa2c-22f8680230b6       |

        Given I have the relation associate_impact_pt_object in my database:
            | pt_object_id                               | impact_id                            |
            | 1ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |
            | 2ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 3ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 4ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |
            | 5ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |
            | 6ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |
            | 7ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |

        Given I have the following applicationperiods in my database:
            | created_at          | updated_at          |id                                   | impact_id                            |start_date                           |end_date            |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b1 | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab234-3d49-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b3 | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b4 | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b5 | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |


        When I get "/impacts?pt_object_type=network&uri[]=network:JDR:1&uri[]=network:JDR:2&start_date=2013-12-02T23:52:12Z&end_date=2014-05-21T23:52:12Z"
        Then the status code should be "200"
        And the header "Content-Type" should be "application/json"
        And the field "objects" should have a size of 2
        And the field "objects.0.impacts" should have a size of 3
        And the field "objects.1.impacts" should have a size of 3

    Scenario: Use uri for network and uri for stop_area filter to display impacts
        Given I have the following disruptions in my database:
            | reference | note  | created_at          | updated_at          | status    | id                                   |
            | foo       | hello | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | published | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following severities in my database:
                | wording   | color   | created_at          | updated_at          | is_visible | id                                   |
                | good news | #654321 | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | True       | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following impacts in my database:
            | created_at          | updated_at          | status    | id                                   | disruption_id                        |severity_id                          |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b1 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b3 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b4 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following ptobject in my database:
            | type      | uri                    | created_at          | updated_at          | id                                         |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 1ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 2ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 3ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 4ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 5ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 6ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | stop_area | stop_area:JDR:SA:CHVIN | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 7ffab232-3d48-4eea-aa2c-22f8680230b6       |

        Given I have the relation associate_impact_pt_object in my database:
            | pt_object_id                               | impact_id                            |
            | 1ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |
            | 2ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 3ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 4ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |
            | 5ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |
            | 6ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |
            | 7ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |

        Given I have the following applicationperiods in my database:
            | created_at          | updated_at          |id                                   | impact_id                            |start_date                           |end_date            |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b1 | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab234-3d49-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b3 | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b4 | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b5 | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |


        When I get "/impacts?uri[]=network:JDR:1&uri[]=stop_area:JDR:SA:CHVIN&start_date=2013-12-02T23:52:12Z&end_date=2014-05-21T23:52:12Z"
        Then the status code should be "200"
        And the header "Content-Type" should be "application/json"
        And the field "objects" should have a size of 2
        And the field "objects.0.impacts" should have a size of 1
        And the field "objects.1.impacts" should have a size of 3
        And the field "objects.0.id" should be "stop_area:JDR:SA:CHVIN"
        And the field "objects.0.name" should be "Château de Vincennes"
        And the field "objects.1.id" should be "network:JDR:1"
        And the field "objects.1.name" should be "RATP"

    Scenario: Not uri not pt_object_type filter to display impacts
        Given I have the following disruptions in my database:
            | reference | note  | created_at          | updated_at          | status    | id                                   |
            | foo       | hello | 2014-04-02T23:52:12 | 2014-04-02T23:55:12 | published | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following severities in my database:
                | wording   | color   | created_at          | updated_at          | is_visible | id                                   |
                | good news | #654321 | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | True       | 7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following impacts in my database:
            | created_at          | updated_at          | status    | id                                   | disruption_id                        |severity_id                          |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b6 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b1 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eea-aa2c-22f8680230b3 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | published | 7ffab234-3d49-4eec-aa2c-22f8680230b4 | 7ffab230-3d48-4eea-aa2c-22f8680230b6 |7ffab232-3d48-4eea-aa2c-22f8680230b6 |

        Given I have the following ptobject in my database:
            | type      | uri                    | created_at          | updated_at          | id                                         |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 1ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 2ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:1          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 3ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 4ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 5ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | network   | network:JDR:2          | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 6ffab232-3d48-4eea-aa2c-22f8680230b6       |
            | stop_area | stop_area:JDR:SA:CHVIN | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 | 7ffab232-3d48-4eea-aa2c-22f8680230b6       |

        Given I have the following ptobject in my database:
            | pt_object_id                               | impact_id                            |
            | 1ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |
            | 2ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 3ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |
            | 4ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |
            | 5ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |
            | 6ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |
            | 7ffab232-3d48-4eea-aa2c-22f8680230b6       | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |

        Given I have the following applicationperiods in my database:
            | created_at          | updated_at          |id                                   | impact_id                            |start_date                           |end_date            |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b1 | 7ffab232-3d47-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b2 | 7ffab234-3d49-4eea-aa2c-22f8680230b6 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b3 | 7ffab234-3d49-4eec-aa2c-22f8680230b1 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b4 | 7ffab232-3d47-4eea-aa2c-22f8680230b2 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b5 | 7ffab234-3d49-4eea-aa2c-22f8680230b3 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |
            | 2014-04-04T23:52:12 | 2014-04-06T22:52:12 |7ffab232-3d47-4eea-aa2c-22f8680230b6 | 7ffab234-3d49-4eec-aa2c-22f8680230b4 |2014-01-20 16:52:00                  |2014-01-30 16:52:00 |


        When I get "/impacts?start_date=2013-12-02T23:52:12Z&end_date=2014-05-21T23:52:12Z"
        Then the status code should be "400"
        And the header "Content-Type" should be "application/json"
