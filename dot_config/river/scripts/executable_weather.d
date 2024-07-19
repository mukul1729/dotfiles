#!/usr/bin/env rdmd

import std.stdio;
import std.conv : to;
import std.datetime;
import std.algorithm;
import std.range;
import std.string;
import std.exception;
import std.json;
import std.array;
import std.format;
import std.process;
import std.net.curl;
import std.math.rounding;

void main(){

	string KEY = "adb8ccb76dfb5edc0d2fe158e8297bfe";
	string ID = "1253986";
	string UNIT = "metric";

	auto icon_codes = [
		"01d":"󰖨 ",
		"01n":"󰖔 ",
		"02d":" ",
		"02n":" ",
		"03d":" ",
		"03n":" ",
		"04d":" ",
		"04n":" ",
		"09d":" ",
		"09n":" ",
		"10d":" ",
		"10n":" ",
		"11d":"⛈ ",
		"11n":"⛈ ",
		"13d":"❄ ",
		"13n":"❄ ",
		"50d":"󰖑 ",
		"50n":"󰖑 ",
	];
	string url =
		format("https://api.openweathermap.org/data/2.5/weather?id=%s&appid=%s&units=%s"
				, ID, KEY, UNIT);
	try 
	{
		auto content = get(url);
		JSONValue json_data = parseJSON(content);

		float temperature = json_data["main"]["temp"].floating;
		string icon = json_data["weather"][0]["icon"].str;
		string description = json_data["weather"][0]["description"].str;
		int humidity = json_data["main"]["humidity"].get!int;
		float feels_like_temp = json_data["main"]["feels_like"].floating;

		string text = format("%s%d°C", icon_codes[icon], floor(temperature).to!int);
		string tooltip = format(" Description: %s \\n Feels like: %d°C \\n Humidity: %s%%",
			description,  floor(feels_like_temp).to!int, humidity);
	
	
		string data = format(`{ "text": "%s", "tooltip": "%s"}`, text, tooltip);
		data.write;
	}
	catch (Exception e)
	{
		writeln("");
	}
}
