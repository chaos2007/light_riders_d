import BoardState;
import Settings;
import std.array : split;
import std.random : choice;
import std.stdio : readln, stdout, write;

void main() {
	string line;
	Settings settings;
	BoardState state;
	while ((line = readln()) !is null)
	{
		auto words = split(line);
		auto const command = words[0];
		auto const parameters = words[1..$];
		switch (command)
		{
			case "action":
				auto array = ["up\n", "right\n", "left\n", "down\n"];
				auto chosen = choice(array);
				write(chosen);
				break;
			case "settings":
				settings.parse_settings(parameters.dup());
				break;
			case "update":
				break;
			default:
				write("WRONG CHOICE.\r\n");
				break;
		}
		stdout.flush();
	}
}

