using System;

class Program
{
    static void Main()
    {
        Console.Write("Enter a string: ");
        string text = Console.ReadLine();

        foreach (char ch in text)
        {
            Console.WriteLine(ch);
        }
    }
}