package se.yrgo.game;

public class GuessingGame
{
    public static void main(String[] args)
    {
        Guesser guessingGame = new Guesser(0, 10);

        guessingGame.start();
    }
}
