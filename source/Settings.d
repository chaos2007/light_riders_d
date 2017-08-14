import dunit.toolkit;
import std.conv;
import std.format;

class Settings {
    int timebank; 
    int time_per_round;
    string[] player_names;
    string my_name;
    int my_id;
    int field_width;
    int field_height;   

    void parse_settings( string[] words) {
        auto setting = words[0];
        auto arguments = words[1..$];
        switch(setting) {
            case "timebank":
                timebank = to!int(arguments[0]);
                break;
            case "time_per_move":
                time_per_round = to!int(arguments[0]);
                break;
            case "player_names":
                player_names = arguments;
                break;
            case "your_bot":
                my_name = arguments[0];
                break;
            case "your_botid":
                my_id = to!int(arguments[0]);
                break;
            case "field_width":
                field_width = to!int(arguments[0]);
                break;
            case "field_height":
                field_height = to!int(arguments[0]);
                break;
            default:
                assert(0);
        }
    } 
}

@system
unittest {

    auto setting = new Settings();

    setting.parse_settings(["timebank", "10000"]);
    setting.timebank.assertEqual(1_000);

    setting.parse_settings(["time_per_move", "500"]);
    setting.time_per_round.assertEqual(500,format("Expected: 500 Actual: %d", setting.time_per_round));

    setting.parse_settings(["your_bot", "JoeCool"]);
    setting.my_name.assertEqual("JoeCool",format("Expected: JoeCool Actual: %s", setting.my_name));

    setting.parse_settings(["player_names", "JoeCool", "JohnLame"]);
    setting.player_names.assertEqual(["JoeCool", "JohnLame"], 
            format("Expected: [JoeCool, JohnLame] Actual: %s", setting.player_names));

    setting.parse_settings(["your_botid", "2"]);
    setting.my_id.assertEqual(2,format("Expected: 2 Actual: %d", setting.my_id));

    setting.parse_settings(["field_width", "30"]);
    setting.field_width.assertEqual(30,format("Expected: 30 Actual: %d", setting.field_width));

    setting.parse_settings(["field_height", "28"]);
    setting.field_height.assertEqual(28,format("Expected: 28 Actual: %d", setting.field_height));
}

