This bot scrapes random articles from the day from the NYTimes API, generates a poem using a Markov Algorithm and word frequencies, and then posts the tweet to twitter. 

On a high level, there are three scripts: 

1. text_gen - this pulls the articles, picks a random one, and grabs the text from it 

2. poem_generator - this cleans the text for the Markov formula and generates a random poem using the given words 

3. scripting - uses the previous two scripts to post the randomly generated poem to twitter. 

If downloading this file for personal use, it is important to note that it will require the specific path of “text_gen.R” and “poem_generator.R” in the scripting file, as well as the specific path of “nounlist.txt” in the poem_generator.R” file. 

In addition, you will need to generate your own API keys and plug those into the “scripting.R” file in order to successfully tweet these poems from your own account. 

Cheers. 