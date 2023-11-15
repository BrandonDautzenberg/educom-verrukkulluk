<?php
//// Allereerst zorgen dat de "Autoloader" uit vendor opgenomen wordt:
require_once("./vendor/autoload.php");

/// Twig koppelen:
$loader = new \Twig\Loader\FilesystemLoader("./templates");
/// VOOR PRODUCTIE:
/// $twig = new \Twig\Environment($loader), ["cache" => "./cache/cc"]);

/// VOOR DEVELOPMENT:
$twig = new \Twig\Environment($loader, ["debug" => true ]);
$twig->addExtension(new \Twig\Extension\DebugExtension());

/******************************/

/// Next step, iets met je data doen. Ophalen of zo
require_once("lib/gerecht.php");
require_once("lib/database.php");
require_once("lib/artikel.php");
require_once("lib/ingredient.php");
require_once('lib/keukentype.php');
require_once('lib/user.php');
require_once('lib/gerechtinfo.php');
require_once('lib/boodschappen.php');

$db = new database();
$gerecht = new gerecht($db->getConnection());
$artikel = new artikel($db->getConnection());
$ingredient = new ingredient($db->getConnection());
$keukentype = new keukentype($db->getConnection());
$user = new user($db->getConnection());
$gerecht_info = new gerechtinfo($db->getConnection());
$boodschappen = new boodschappen($db->getConnection());

$data = $gerecht->selecteer_gerecht();

/*
URL:
http://localhost/index.php?gerecht_id=4&action=detail
*/

$gerecht_id = isset($_GET["gerecht_id"]) ? $_GET["gerecht_id"] : "detail";
$action = isset($_GET["action"]) ? $_GET["action"] : "homepage";
$waardering = 0;
$totaal = 0;

switch($action) {

        case "homepage": {
            $data = $gerecht->selecteer_gerecht();
            $template = 'homepage.html.twig';
            $title = "Verrukkulluk!";
            break;
        }

        case "detail": {
            $data = $gerecht->selecteer_gerecht($gerecht_id);
            $template = 'detail.html.twig';
            $title = "Detailpagina";
            break;
        }

        case "waardering": {
            $aantal = $_GET["aantal"];
            $gerecht_id = $_GET["gerecht_id"];
            header('Content-Type: application/json; charset=utf-8'); 
            $data = $gerecht_info->add_waardering($gerecht_id, $aantal);
            $json = json_encode($data);
            echo $json;
            $waardering = 1;
            die();
            break;
        };

        case "favoriet": {
            $gerecht_id = $_GET["gerecht_id"];
            $user_id = $_GET["user_id"];
            header('Content-Type: application/json; charset=utf-8');
            if (isset($_GET["verwijderen"])) {
                $data = $gerecht_info->favoriet_verwijderen($gerecht_id, $user_id);
            } else {
                $data = $gerecht_info->favoriet_toevoegen($gerecht_id, $user_id);
            }
            $json = json_encode($data);
            echo $json;
            die();
            break;
        };

        case "boodschappen": {
            $user_id = $_GET["user_id"];
            $gerecht_id = $_GET["gerecht_id"];
            //boodschappen->boodschappen_toevoegen($gerecht_id, $user_id);
            $data = $boodschappen->ophalen_boodschappen($user_id);
            $totaal = $boodschappen->bereken_totaal($user_id);
            $template = 'boodschappen.html.twig';
            $title = 'Boodschappen';
        }
    };

/// Onderstaande code schrijf je idealiter in een layout klasse of iets dergelijks
/// Juiste template laden, in dit geval "homepage"
$template = $twig->load($template);


/// En tonen die handel!
echo $template->render(["title" => $title, "data" => $data, "totaal" => $totaal]);