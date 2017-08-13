import std.algorithm;
import std.array;
import std.random;
import std.stdio;

void main() {
	string line;
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
			default:
				assert(0);
		}
		stdout.flush();
	}
}

