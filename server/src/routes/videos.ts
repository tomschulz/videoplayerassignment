import { Router, Request, Response } from 'express';
import { videos as videosData } from '../data/videos';
import shuffle from 'knuth-shuffle-seeded';

export const videos = Router();

videos.get('/', async (_: Request, res: Response) => {
  shuffle(videosData);

  res.header('Content-Type', 'application/json');
  res.header('Cache-Control', 'no-store');

  res.status(200);
  res.send(JSON.stringify(videosData));
});
