FORMAT: 1A
HOST: https://ogv2ws.apiary-mock.com

#Web Services Ogesper v2
Les web Services Ogesper v2 permettent la gestion des perturbations sur un référentiel de transport.
Les entités manipulées par le web service sont:

   - les perturbations (disruptions), qui représentent toutes situations affectant positivement ou négativement le réseau de transport.
   - les impacts (impacts), qui représentent toute application d'une perturbation sur une entité du référentiel de transport (ligne, zone d'arrêt, ...).
   - les sévérités, ou conséquences (severities), qui représentent les conséquences d'un impact sur l'entité du référentiel affectée (bloquant, information, ...)
   - les causes, ou motif (causes), qui représentent les origine de la perturbation (obstacle sur les voies, accident de voyageur, ...)
   - les canaux de diffusion (channels), qui représentent les medias vers lesquels les informations seront transmises.

Pour chacune des entités présentées, les web services proposent les fonctions de création, suppression, édition, liste, et recherche unitaire. Sauf mention contraire, seules les fonctions de liste et de recherche sont proposées à l'implémentation.

L'ensemble des services retournent les URLs nécessaires à une séquence d'appel. Par exemple, l'API disruptions retourne une URL permettant d'accéder au détail de chaque perturbation retournée (attribut "self"), des liens vers la liste des impacts de la perturbation ("impacts"); il est donc inutile de retravailler les paramètres d'appels côté media entre deux interrogations.
Dans ce document, toutes les sections décrivent les différents points d'entrée.

Dans chacune des APIs il est décrit les méthodes http qui sont implémentées

En général les APIs implémentent sur les méthodes GET la pagination. On peut alors préciser l'id du 
premier item de la page grâce au paramètre start_index, puis préciser le
nombre d'items que l'on veut par page à l'aide du paramètre items_per_page.

Le nom des paramètres respecte : www.opensearch.org

Certaines des urls contiennent des places holders, ils sont contenus entre { },
il faudra remplacer, { }, par une valeur.
Exemple : /disruptions/{disruption_id}/impacts
Cette url n'est pas valide, il faut remplacer {disruption_id} par un id de
disruption valide.

# Racine [/]
##Récupérer la liste des API [GET]

- response 200 (application/json)
    * Body

            {
                "disruptions": {"href": "https://ogv2ws.apiary-mock.com/disruptions"},
                "disruption": {"href": "https://ogv2ws.apiary-mock.com/disruptions/{id}", "templated": true},
                "severities": {"href": "https://ogv2ws.apiary-mock.com/severities"},
                "causes": {"href": "https://ogv2ws.apiary-mock.com/causes"},
                "channels": {"href": "https://ogv2ws.apiary-mock.com/channels"}
            }


# Liste des perturbations [/disruptions]

##Récupérer les disruptions [GET]
Retourne la liste de toutes les perturbations visibles.
##Paramètres

| Name                 | description                                                                               | required | default                 |
| -------------------- | ----------------------------------------------------------------------------------------- | -------- | ----------------------- |
| start_index          | Index du premier item de la page (commence par 1)                                         | false    | 1                       |
| items_per_page       | Nombre d'items par page                                                                   | false    | 20                      |
| publication_status[] | Filtre sur publication_status,  les valeurs possibles sont : past, ongoing, coming        | false    | [past, ongoing, coming] |
| current_time         | Permet de changer l'heure d'appel, sert surtout pour le debug                             | false    | NOW                     |

@TODO: search and sort

Le champs ```publication_status``` permet, par rapport à l'heure de référence passée en paramètre, de retourner les perturbations en cours (c'est à dire ayant des dates/heures de publications encadrant la date/heure de référence), à venir (qui ont des dates/heures de publications postérieures à la date/heure de référence) ou passées (ayant des dates/heures de publications antérieures à la date/heure de référence).

- response 200 (application/json)

    * Body

            {
                "disruptions": [
                    {
                        "id": "d30502d2-e8de-11e3-8c3e-0008ca8657ea",
                        "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ea"},
                        "reference": "RER B en panne",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z",
                        "note": "blablbla",
                        "status": "published",
                        "publication_status": "ongoing",
                        "contributor": "shortterm.tn",
                        "cause": {
                            "id": "3d1f34b2-e8df-11e3-8c3e-0008ca8657ea",
                            "wording": "Condition météo"
                        },
                        "tags": ["rer", "meteo", "probleme"],
                        "localization": [
                            {
                                "id": "stop_area:RTP:SA:3786125",
                                "name": "HENRI THIRARD - LEON JOUHAUX",
                                "type": "stop_area",
                                "coord": {
                                    "lat": "48.778867",
                                    "lon": "2.340927"
                                }
                            },
                            {
                                "id": "stop_area:RTP:SA:3786123",
                                "name": "DE GAULLE - GOUNOD - TABANOU",
                                "type": "stop_area",
                                "coord": {
                                    "lat": "48.780179",
                                    "lon": "2.340886"
                                }
                            }
                        ],
                        "publication_period" : {
                            "begin":"2014-04-31T17:00:00Z",
                            "end":"2014-05-01T17:00:00Z"
                        },
                        "impacts": {
                            "pagination": {
                                "start_index": 0,
                                "items_per_page": 20,
                                "total_results": 3,
                                "prev": null,
                                "next": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ea/impacts?start_index=1&item_per_page=20"},
                                "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ea/impacts?start_index=1&item_per_page=20"},
                                "last": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ea/impacts?start_index=1&item_per_page=20"}
                            }
                        }
                    },
                    {
                        "id": "d30502d2-e8de-11e3-8c3e-0008ca8657eb",
                        "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657eb"},
                        "reference": "RER A en panne",
                        "created_at": "2014-05-31T16:52:18Z",
                        "updated_at": null,
                        "note": null,
                        "status": "published",
                        "publication_status": "coming",
                        "contributor": "shortterm.tn",
                        "cause": {
                            "id": "3d1f34b2-e8ef-11e3-8c3e-0008ca8657ea",
                            "wording": "train cassé"
                        },
                        "tags": ["rer", "probleme"],
                        "localization": [],
                        "publication_period" : {
                            "begin": "2014-04-31T17:00:00Z",
                            "end": null
                        },
                        "impacts": {
                            "pagination": {
                                "start_index": 0,
                                "items_per_page": 20,
                                "total_results": 5,
                                "prev": null,
                                "next": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657eb/impacts?start_index=1&item_per_page=20"},
                                "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657eb/impacts?start_index=1&item_per_page=20"},
                                "last": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657eb/impacts?start_index=1&item_per_page=20"}
                            }
                        }
                    },
                    {
                        "id": "d30502d2-e8de-11e3-8c3e-0008ca8657ec",
                        "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ec"},
                        "reference": "Chatelet fermé",
                        "created_at": "2014-05-17T16:52:18Z",
                        "update_at": "2014-05-31T06:55:18Z",
                        "note": "retour probable d'ici 5H",
                        "status": "published",
                        "publication_status": "past",
                        "contributor": "shortterm.tn",
                        "cause": {
                            "id": "3d1f34b2-e2df-11e3-8c3e-0008ca8657ea",
                            "wording": "émeute"
                        },
                        "tags": ["rer", "metro", "probleme"],
                        "localization": [
                            {
                                "id": "stop_area:RTP:SA:378125",
                                "name": "Chatelet",
                                "type": "stop_area",
                                "coord": {
                                    "lat": "48.778867",
                                    "lon": "2.340927"
                                }
                            }
                        ],
                        "publication_period" : {
                            "begin": "2014-04-31T17:00:00Z",
                            "end": null
                        },
                        "impacts": {
                            "pagination": {
                                "start_index": 0,
                                "items_per_page": 20,
                                "total_results": 25,
                                "prev": null,
                                "next": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ec/impacts?start_index=1&item_per_page=20"},
                                "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ec/impacts?start_index=1&item_per_page=20"},
                                "last": {"href": "https://ogv2ws.apiary-mock.com/disruptions/d30502d2-e8de-11e3-8c3e-0008ca8657ec/impacts?start_index=21&item_per_page=20"}
                            }
                        }
                    }

                ],
                "meta": {
                    "pagination": {
                        "start_index": 1,
                        "items_per_page": 3,
                        "total_results": 6,
                        "prev": null,
                        "next": {"href": "https://ogv2ws.apiary-mock.com/disruptions/?start_index=4&item_per_page=3"},
                        "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/?start_index=1&item_per_page=3"},
                        "last": {"href": "https://ogv2ws.apiary-mock.com/disruptions/?start_index=4&item_per_page=3"}
                    }
                }

            }

##Créer une perturbation [POST]

###Paramètres
Création d'une perturbation avec des impacts.

- Request (application/json)

    * Body

            {
                "reference": "foo",
                "note": null,
                "contributor": "shortterm.tn",
                "cause": {
                       "id": "3d1f34b2-e8df-1ae3-8c3e-0008ca8657ea"
                }
                "tags": ["rer", "meteo", "probleme"],
                "localization": [
                    {
                        "id": "stop_area:RTP:SA:3786125",
                        "type": "stop_area"
                    },
                    {
                        "id": "stop_area:RTP:SA:3786123",
                        "type": "stop_area"
                    }
                ],
                "publication_period" : {
                    "begin": "2014-04-31T17:00:00Z",
                    "end": null
                },
                "impacts": [
                    {
                        "severity": {
                            "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8657ea"
                        },
                        "application_periods": [
                            {
                                "begin": "2014-04-31T16:52:00Z",
                                "end": "2014-05-22T02:15:00Z"
                            }
                        ],
                        "messages": [
                            {
                                "text": "ptit dej à la gare!!",
                                "publication_date": ["2014-04-31T16:52:18Z"],
                                "publication_period": null,
                                "channel": {
                                    "id": "3d1f42b6-e8df-11e3-8c3e-0008ca8657ea"
                                }
                            },
                            {
                                "text": "#Youpi\n**aujourd'hui c'est ptit dej en gare",
                                "publication_period" : {
                                    "begin":"2014-04-31T17:00:00Z",
                                    "end":"2014-05-01T17:00:00Z"
                                },
                                "publication_date" : null,
                                "channel": {
                                    "id": "3d1f42b6-e8df-11e3-8c3e-0008ca8657ea"
                                }
                            }
                        ],
                        "objects": [
                            {
                                "id": "stop_area:RTP:SA:3786125",
                                "type": "stop_area"
                            },
                            {
                                "id": "line:RTP:LI:378",
                                "type": "line"
                            }
                        ]
                    }
                ]
            }



- response 201 (application/json)

    * Body

            {
                "disruption":{
                    "id": "3d1f32b2-e8df-11e3-8c3e-0008ca8657ea",
                    "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea"},
                    "reference": "foo",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": null,
                    "note": null,
                    "status": "published",
                    "publication_status": "ongoing",
                    "contributor": "shortterm.tn",
                    "cause": {
                        "id": "3d1f34b2-e8df-1ae3-8c3e-0008ca8657ea",
                        "wording": "Condition météo"
                    },
                    "tags": ["rer", "meteo", "probleme"],
                    "localization": [
                        {
                            "id": "stop_area:RTP:SA:3786125",
                            "name": "HENRI THIRARD - LEON JOUHAUX",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.778867",
                                "lon": "2.340927"
                            }
                        },
                        {
                            "id": "stop_area:RTP:SA:3786123",
                            "name": "DE GAULLE - GOUNOD - TABANOU",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.780179",
                                "lon": "2.340886"
                            }
                        }
                    ],
                    "publication_period" : {
                        "begin": "2014-04-31T17:00:00Z",
                        "end": null
                    },
                    "impacts": {
                        "pagination": {
                            "start_index": 0,
                            "items_per_page": 20,
                            "total_results": 1,
                            "prev": null,
                            "next": null,
                            "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/1/impacts?start_index=1&item_per_page=20"},
                            "last": null
                        }
                    }
                },
                "meta": {}
            }


# Disruptions [/disruptions/{id}]
##Récupérer une perturbation [GET]

##Paramètres

Retourne une perturbation (si elle existe):

- response 200 (application/json)

    * Body

            {
                "disruption": {
                    "id": "3d1f32b2-e8df-11e3-8c3e-0008ca8657ea",
                    "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea"},
                    "reference": "RER B en panne",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z",
                    "note": "blablbla",
                    "status": "published",
                    "publication_status": "ongoing",
                    "contributor": "shortterm.tn",
                    "cause": {
                        "id": "3d1e32b2-e8df-11e3-8c3e-0008ca8657ea",
                        "wording": "Condition météo"
                    },
                    "tags": ["rer", "meteo", "probleme"],
                    "localization": [
                        {
                            "id": "stop_area:RTP:SA:3786125",
                            "name": "HENRI THIRARD - LEON JOUHAUX",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.778867",
                                "lon": "2.340927"
                            }
                        },
                        {
                            "id": "stop_area:RTP:SA:3786123",
                            "name": "DE GAULLE - GOUNOD - TABANOU",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.780179",
                                "lon": "2.340886"
                            }
                        }
                    ],
                    "publication_period" : {
                        "begin": "2014-04-31T17:00:00Z",
                        "end": null
                    },
                    "impacts": {
                        "pagination": {
                            "start_index": 1,
                            "items_per_page": 20,
                            "total_results": 3,
                            "prev": null,
                            "next": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea/impacts?start_index=1&item_per_page=20"},
                            "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea/impacts?start_index=1&item_per_page=20"},
                            "last": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea/impacts?start_index=1&item_per_page=20"}
                        }
                    }
                },
                "meta": {}
            }


- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No disruption"
                },
                "meta": {}
            }


##Mise à jour d'une perturbation [PUT]

###Paramètres


- Request

    * Headers

            Content-Type: application/json

    * Body

            {
                "reference": "foo",
                "note": null,
                "contributor": "shortterm.tn",
                "cause": {
                    "id": "3d1f32b2-e8df-11e3-8c3e-0008ca86c7ea"
                }
                "tags": ["rer", "meteo", "probleme"],
                "localization": [
                    {
                        "id": "stop_area:RTP:SA:3786125",
                        "type": "stop_area"
                    },
                    {
                        "id": "stop_area:RTP:SA:3786123",
                        "type": "stop_area"
                    }
                ],
                "publication_period" : {
                    "begin": "2014-04-31T17:00:00Z",
                    "end": null
                }
            }


- Response 200 (application/json)

    * Body

            {
                "disruption":{
                    "id": "3d1f32b2-e8df-11e3-8c3e-0008ca8657ea",
                    "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea"},
                    "reference": "foo",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z",
                    "note": null,
                    "status": "published",
                    "publication_status": "ongoing",
                    "contributor": "shortterm.tn",
                    "cause": {
                        "id": "3d1f32b2-e8df-11e3-8c3e-0008ca8657ea",
                        "wording": "Condition météo"
                    },
                    "tags": ["rer", "meteo", "probleme"],
                    "localization": [
                        {
                            "id": "stop_area:RTP:SA:3786125",
                            "name": "HENRI THIRARD - LEON JOUHAUX",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.778867",
                                "lon": "2.340927"
                            }
                        },
                        {
                            "id": "stop_area:RTP:SA:3786123",
                            "name": "DE GAULLE - GOUNOD - TABANOU",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.780179",
                                "lon": "2.340886"
                            }
                        }
                    ],
                    "publication_period" : {
                        "begin": "2014-04-31T17:00:00Z",
                        "end": null
                    },
                    "impacts": {
                        "pagination": {
                            "start_index": 0,
                            "items_per_page": 20,
                            "total_results": 0,
                            "prev": null,
                            "next": null,
                            "first": null,
                            "last": null
                        }
                    }
                },
                "meta": {}
            }

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No disruption"
                },
                "meta": {}
            }

##Effacer une perturbation [DELETE]
Cette fonction archive une perturbation, elle pourra être restaurée par la suite. 
###Paramètres


- Response 204

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No disruption"
                },
                "meta": {}
            }


# Liste des Impacts [/disruptions/{disruption_id}/impacts]

##Retourne les impacts [GET]
Retourne tous les impacts d'une perturbation
###Paramètres

| Name                 | description                                        | required | default                 |
| -------------------- | -------------------------------------------------- | -------- | ----------------------- |
| start_index          | Index du premier item de la page (commence par 1)  | false    | 1                       |
| items_per_page       | Nombre d'items par page                            | false    | 20                      |

@TODO: recherche et tri.
Aucun filtre actuellement sur la récupération de liste des impacts: l'interrogation se fait seulement avec un identifiant de perturbation, afin de récupérer l'ensemble des impacts déclarés pour la perturbation demandée.

- response 200 (application/json)

    * Body

            {
                "impacts": [
                    {
                        "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8657ea",
                        "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f32b2-e8df-11e3-8c3e-0008ca8657ea/impacts/3d1f42b2-e8df-11e3-8c3e-0008ca8657ea"},
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z",
                        "severity": {
                            "id": "3d1f42b2-e8df-11e3-8c3e-0008ca86c7ea",
                            "wording": "Bonne nouvelle",
                            "created_at": "2014-04-31T16:52:18Z",
                            "updated_at": "2014-04-31T16:55:18Z",
                            "color": "#123456",
                            "effect": "none"
                        },
                        "application_periods": [
                            {
                                "begin": "2014-04-31T16:52:00Z",
                                "end": "2014-05-22T02:15:00Z"
                            }
                        ],
                        "messages": [
                            {
                                "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8657ca",
                                "created_at": "2014-04-31T16:52:18Z",
                                "updated_at": "2014-04-31T16:55:18Z",
                                "text": "ptit dej à la gare!!",
                                "publication_date": ["2014-04-31T16:52:18Z"],
                                "publication_period": null,
                                "channel": {
                                    "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8657da",
                                    "name": "message court",
                                    "content_type": "text/plain",
                                    "created_at": "2014-04-31T16:52:18Z",
                                    "updated_at": "2014-04-31T16:55:18Z",
                                    "max_size": 140
                                }
                            },
                            {
                                "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8257ea",
                                "created_at": "2014-04-31T16:52:18Z",
                                "updated_at": "2014-04-31T16:55:18Z",
                                "text": "#Youpi\n**aujourd'hui c'est ptit dej en gare",
                                "publication_period" : {
                                    "begin":"2014-04-31T17:00:00Z",
                                    "end":"2014-05-01T17:00:00Z"
                                },
                                "publication_date" : null,
                                "channel": {
                                    "id": "3d1f42b2-e8df-11e3-8c3e-0008cb8657ea",
                                    "name": "message long",
                                    "content_type": "text/markdown",
                                    "created_at": "2014-04-31T16:52:18Z",
                                    "updated_at": "2014-04-31T16:55:18Z",
                                    "max_size": null
                                }
                            }
                        ],
                        "objects": [
                            {
                                "id": "stop_area:RTP:SA:3786125",
                                "name": "HENRI THIRARD - LEON JOUHAUX",
                                "type": "stop_area",
                                "coord": {
                                    "lat": "48.778867",
                                    "lon": "2.340927"
                                }
                            },
                            {
                                "id": "line:RTP:LI:378",
                                "name": "DE GAULLE - GOUNOD - TABANOU",
                                "type": "line",
                                "code": 2,
                                "color": "FFFFFF"
                            }
                        ],
                        "disruption" : {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-823e-0008ca8657ea"}
                    }
                ],
                "meta": {
                    "pagination": {
                        "start_index": 1,
                        "items_per_page": 3,
                        "total_results": 6,
                        "prev": null,
                        "next": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-823e-0008ca8657ea/impacts?start_index=4&items_per_page=3"},
                        "first": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-823e-0008ca8657ea/impacts?start_index=1&items_per_page=3"},
                        "last": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-823e-0008ca8657ea/impacts?start_index=4&items_per_page=3"}
                    }
                }
            }



##Créer un impact [POST]
Création d'un nouvel impact.
###Paramètres

- request
    + headers

            Content-Type: application/json

    + body

            {
                "severity": {
                    "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8657ea"
                },
                "application_periods": [
                    {
                        "begin": "2014-04-31T16:52:00Z",
                        "end": "2014-05-22T02:15:00Z"
                    }
                ],
                "messages": [
                    {
                        "text": "ptit dej à la gare!!",
                        "publication_date": ["2014-04-31T16:52:18Z"],
                        "publication_period": null,
                        "channel": {
                            "id": "3d1f42b2-e8df-11e3-8c3e-0008ca86c7ea"
                        }
                    },
                    {
                        "text": "#Youpi\n**aujourd'hui c'est ptit dej en gare",
                        "publication_period" : {
                            "begin":"2014-04-31T17:00:00Z",
                            "end":"2014-05-01T17:00:00Z"
                        },
                        "publication_date" : null,
                        "channel": {
                            "id": "3d1f42b2-e8df-11e3-8c3e-0002ca8657ea"
                        }
                    }
                ],
                "objects": [
                    {
                        "id": "stop_area:RTP:SA:3786125",
                        "type": "stop_area"
                    },
                    {
                        "id": "line:RTP:LI:378",
                        "type": "line"
                    }
                ]
            }

- response 200 (application/json)

    * Body

            {
                "impact": {
                    "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8617ea",
                    "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-8c3e-0008ca8647ea/impacts/3d1f42b2-e8df-11e3-8c3e-0008ca8617ea"},
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z",
                    "severity": {
                        "id": "3d1f42b2-e8df-11e3-8c3e-0008ca861aea",
                        "wording": "Bonne nouvelle",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z",
                        "color": "#123456",
                        "effect": "none"
                    },
                    "application_periods": [
                        {
                            "begin": "2014-04-31T16:52:00Z",
                            "end": "2014-05-22T02:15:00Z"
                        }
                    ],
                    "messages": [
                        {
                            "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8631ea",
                            "created_at": "2014-04-31T16:52:18Z",
                            "updated_at": "2014-04-31T16:55:18Z",
                            "text": "ptit dej à la gare!!",
                            "publication_date": ["2014-04-31T16:52:18Z"],
                            "publication_period": null,
                            "channel": {
                                "id": "3d1f42b2-e8df-11e3-8c3e-0008ca86a7ea",
                                "name": "message court",
                                "content_type": "text/plain",
                                "created_at": "2014-04-31T16:52:18Z",
                                "updated_at": "2014-04-31T16:55:18Z",
                                "max_size": 140
                            }
                        },
                        {
                            "id": "3d1f42b2-e8df-11a3-8c3e-0008ca8617ea",
                            "created_at": "2014-04-31T16:52:18Z",
                            "updated_at": "2014-04-31T16:55:18Z",
                            "text": "#Youpi\n**aujourd'hui c'est ptit dej en gare",
                            "publication_period" : {
                                "begin":"2014-04-31T17:00:00Z",
                                "end":"2014-05-01T17:00:00Z"
                            },
                            "publication_date" : null,
                            "channel": {
                                "id": "3d1f42b2-e8af-11e3-8c3e-0008ca8617ea",
                                "name": "message long",
                                "content_type": "text/markdown",
                                "created_at": "2014-04-31T16:52:18Z",
                                "updated_at": "2014-04-31T16:55:18Z",
                                "max_size": null
                            }
                        }
                    ],
                    "objects": [
                        {
                            "id": "stop_area:RTP:SA:3786125",
                            "name": "HENRI THIRARD - LEON JOUHAUX",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.778867",
                                "lon": "2.340927"
                            }
                        },
                        {
                            "id": "line:RTP:LI:378",
                            "name": "DE GAULLE - GOUNOD - TABANOU",
                            "type": "line",
                            "code": 2,
                            "color": "FFFFFF"
                        }
                    ],
                    "disruption" : {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-1c3e-0008ca8617ea"}
                },
                "meta": {}
            }


#Impact [/disruptions/{disruption_id}/impacts/{id}]
##Retourne un impact [GET]
###Paramètres

- response 200 (application/json)

    * Body

            {
                "impact": {
                    "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8617ea",
                    "self": {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-8c3e-0008ca8647ea/impacts/3d1f42b2-e8df-11e3-8c3e-0008ca8617ea"},
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z",
                    "severity": {
                        "id": "3d1f42b2-e8df-11e3-8c3e-0008ca861aea",
                        "wording": "Bonne nouvelle",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z",
                        "color": "#123456",
                        "effect": "none"
                    },
                    "application_periods": [
                        {
                            "begin": "2014-04-31T16:52:00Z",
                            "end": "2014-05-22T02:15:00Z"
                        }
                    ],
                    "messages": [
                        {
                            "id": "3d1f42b2-e8df-11e3-8c3e-0008ca8631ea",
                            "created_at": "2014-04-31T16:52:18Z",
                            "updated_at": "2014-04-31T16:55:18Z",
                            "text": "ptit dej à la gare!!",
                            "publication_date": ["2014-04-31T16:52:18Z"],
                            "publication_period": null,
                            "channel": {
                                "id": "3d1f42b2-e8df-11e3-8c3e-0008ca86a7ea",
                                "name": "message court",
                                "content_type": "text/plain",
                                "created_at": "2014-04-31T16:52:18Z",
                                "updated_at": "2014-04-31T16:55:18Z",
                                "max_size": 140
                            }
                        },
                        {
                            "id": "3d1f42b2-e8df-11a3-8c3e-0008ca8617ea",
                            "created_at": "2014-04-31T16:52:18Z",
                            "updated_at": "2014-04-31T16:55:18Z",
                            "text": "#Youpi\n**aujourd'hui c'est ptit dej en gare",
                            "publication_period" : {
                                "begin":"2014-04-31T17:00:00Z",
                                "end":"2014-05-01T17:00:00Z"
                            },
                            "publication_date" : null,
                            "channel": {
                                "id": "3d1f42b2-e8af-11e3-8c3e-0008ca8617ea",
                                "name": "message long",
                                "content_type": "text/markdown",
                                "created_at": "2014-04-31T16:52:18Z",
                                "updated_at": "2014-04-31T16:55:18Z",
                                "max_size": null
                            }
                        }
                    ],
                    "objects": [
                        {
                            "id": "stop_area:RTP:SA:3786125",
                            "name": "HENRI THIRARD - LEON JOUHAUX",
                            "type": "stop_area",
                            "coord": {
                                "lat": "48.778867",
                                "lon": "2.340927"
                            }
                        },
                        {
                            "id": "line:RTP:LI:378",
                            "name": "DE GAULLE - GOUNOD - TABANOU",
                            "type": "line",
                            "code": 2,
                            "color": "FFFFFF"
                        }
                    ],
                    "disruption" : {"href": "https://ogv2ws.apiary-mock.com/disruptions/3d1f42b2-e8df-11e3-1c3e-0008ca8617ea"}
                },
                "meta": {}
            }

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No disruption or impact"
                },
                "meta": {}
            }

#Liste des sévérités [/severities]

##Retourne la liste de toutes les sévérités [GET]
Permet de récupérer l'ensemble des sévérités (ou conséquences) déclarées. Les propriétés à noter sont: le wording (utilisé dans l'IHM Ogesper v2), l'identifiant unique, l'effet (bloquant ou pas) et le code couleur.

- response 200 (application/json)

    * Body

            {
                "severities": [
                    {
                        "id": "3d1f42b3-e8df-11e3-8c3e-0008ca8617ea",
                        "wording": "normal",
                        "effect": "none",
                        "color": "#123456",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    },
                    {
                        "id": "3d1f42b4-e8df-11e3-8c3e-0008ca8617ea",
                        "wording": "majeur",
                        "effect": "none",
                        "color": "#123456",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    },
                    {
                        "id": "3d1f42b5-e8df-11e3-8c3e-0008ca8617ea",
                        "wording": "bloquant",
                        "effect": "blocking",
                        "color": "#123456",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    }
                ],
                "meta": {}
            }

##Créer une sévérité [POST]
- request
    + headers

            Content-Type: application/json
    * Body

                {
                    "wording": "normal",
                    "color": "#123456",
                    "effect": "none"
                }

- response 200 (application/json)

    * Body

            {
                "severity": {
                    "id": "3d1f42b3-e8df-11e3-8c3e-0008ca8617ea",
                    "wording": "normal",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": null,
                    "color": "#123456",
                    "effect": "none"
                },
                "meta": {}
            }


# Severities [/severities/{id}]
##Retourne une sévérité [GET]

##Paramètres

Retourne une sévérité existante.

- response 200 (application/json)

    * Body

            {
                "severity": {
                    "id": "3d1f42b3-e8df-11e3-8c3e-0008ca8617ea",
                    "wording": "normal",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": null,
                    "color": "#123456",
                    "effect": "none"
                },
                "meta": {}
            }


- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No severity"
                },
                "meta": {}
            }

##Mise à jour d'une sévérité [PUT]

###Paramètres

- Request

    * Headers

            Content-Type: application/json

    * Body

            {
                "wording": "Bonne nouvelle",
                "color": "#123456",
                "effect": "none"
            }


- Response 200 (application/json)

    * Body

            {
                "severity": {
                    "id": "3d1f42b3-e8df-11e3-8c3e-0008ca8617ea",
                    "wording": "Bonne nouvelle",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z",
                    "color": "#123456",
                    "effect": "none"
                },
                "meta": {}
            }

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No severity"
                },
                "meta": {}
            }

##Archive une sévérité [DELETE]
Archive une sévérité.
###Paramètres


- Response 204

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No severity"
                },
                "meta": {}
            }

#Liste des causes [/causes]

##Retourne la liste de toutes les causes [GET]

- response 200 (application/json)

    * Body

            {
                "causes": [
                    {
                        "id": "3d1f42b2-e8df-11e4-8c3e-0008ca8617ea",
                        "wording": "météo",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    },
                    {
                        "id": "3d1f42b2-e8df-11e5-8c3e-0008ca8617ea",
                        "wording": "gréve",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    },
                    {
                        "id": "3d1f42b2-e8df-11e6-8c3e-0008ca8617ea",
                        "wording": "accident voyageur",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    }
                ],
                "meta": {}
            }

##Créer une cause [POST]
- request
    + headers

            Content-Type: application/json
    * Body

                {
                    "wording": "météo"
                }

- response 200 (application/json)

    * Body

            {
                "cause": {
                    "id": "3d1f42b2-e8df-11e4-8c3e-0008ca8617ea",
                    "wording": "météo",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": null
                },
                "meta": {}
            }

# Causes [/causes/{id}]
##Retourne une cause. [GET]

##Paramètres

Retourne une cause existante.

- response 200 (application/json)

    * Body

            {
                "cause": {
                    "id": "3d1f42b2-e8df-11e4-8c3e-0008ca8617ea",
                    "wording": "météo",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": null
                },
                "meta": {}
            }


- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No cause"
                },
                "meta": {}
            }

##Mise à jour d'une cause [PUT]
###Paramètres


- Request

    * Headers

            Content-Type: application/json

    * Body

            {
                "wording": "accident voyageur"
            }

- Response 200 (application/json)

    * Body

            {
                "cause": {
                    "id": "3d1f42b3-e8df-11e3-8c3e-0008ca8617ea",
                    "wording": "accident voyageur",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z"
                },
                "meta": {}
            }

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No cause"
                },
                "meta": {}
            }

##Archive une cause [DELETE]
Archive une cause.
###Paramètres


- Response 204

- response 404 (application/json)
    * Body

            {
                "error": {
                    "message": "No cause"
                },
                "meta": {}
            }

#Liste des canaux de diffusions [/channels]

##Retourne la liste de tous les canaux de diffusion [GET]

- response 200 (application/json)

    * Body

            {
                "channels": [
                    {
                        "id": "3d1f42b2-e8df-11e4-8c3e-0008ca8617ea",
                        "name": "court",
                        "max_size": 140,
                        "content_type": "text/plain",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    },
                    {
                        "id": "3d1a42b7-e8df-11e4-8c3e-0008ca8617ea",
                        "name": "long",
                        "max_size": 512,
                        "content_type": "text/plain",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    },
                    {
                        "id": "3d1f42b2-e8df-11e4-8c3e-0008ca8617ea",
                        "name": "long riche",
                        "max_size": null,
                        "content_type": "text/markdown",
                        "created_at": "2014-04-31T16:52:18Z",
                        "updated_at": "2014-04-31T16:55:18Z"
                    }
                ],
                "meta": {}
            }

##Créer un canal [POST]

- request
    + headers

            Content-Type: application/json
    * Body

                {
                    "name": "court",
                    "max_size": 140,
                    "content_type": "text/plain"
                }

- response 200 (application/json)

    * Body

            {
                "channel": {
                    "id": "3d1f42b2-e8df-11e4-8c3e-0008ca8617ea",
                    "name": "court",
                    "max_size": 140,
                    "content_type": "text/plain",
                    "created_at": "2014-04-31T16:52:18Z",
                    "updated_at": "2014-04-31T16:55:18Z"
                },
                "meta": {}
            }
