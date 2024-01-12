import express, { Response, Request, NextFunction } from 'express';
import cors from 'cors';
import { videos } from './routes/videos';
import { AppError } from './typings/AppError';

// CORS header configuration
const corsOptions = {
  methods: 'GET',
  allowedHeaders: 'Content-Type,Authorization',
};

export const app = express();

// Routes
app.use('/videos', cors(corsOptions), videos);

// error handling middleware should be loaded after the loading the routes
app.use(
  '/',
  (err: AppError, req: Request, res: Response, next: NextFunction) => {
    const status = err.status || 500;

    const formattedError: { status: number; message: string } = {
      status,
      message: err.message,
    };

    res.status(status);
    res.send(JSON.stringify(formattedError));
  }
);
