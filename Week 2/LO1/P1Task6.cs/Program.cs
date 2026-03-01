using System;

class Program
{
    static void Main()
    {
        /*
        Array Declaration Comparison:

        C++:
        int arr[5];

        Python:
        arr = [0, 0, 0, 0, 0]

        C#:
        int[] arr = new int[5];
        */

        int[] arr = new int[5];

        Console.WriteLine("Enter 5 integers:");
        for (int i = 0; i < 5; i++)
        {
            arr[i] = Convert.ToInt32(Console.ReadLine());
        }

        Console.WriteLine("You entered:");
        for (int i = 0; i < 5; i++)
        {
            Console.Write(arr[i] + " ");
        }
    }
}