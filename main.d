import std.stdio;
import std.random;
import std.algorithm;
import std.array;

void main() {
	string line;
	while ((line = readln()) !is null)
	{
		auto words = split(line);
		auto command = words[0];
		auto parameters = words[1..$];
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

