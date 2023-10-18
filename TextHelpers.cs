class H
{
    static void CenterText(string text)
    {
        int totalWidth = Console.WindowWidth;
        int padding = (totalWidth - text.Length) / 2;

        // Output spaces for padding before the text
        Console.WriteLine(new string(' ', padding) + text);
    }
}