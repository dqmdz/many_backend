import express, { Request, Response, NextFunction } from 'express';
import { PrismaClient } from '@prisma/client';

const app = express();
const port = 5000;

app.use(express.json());

const prisma = new PrismaClient();

interface PersonaInput {
  nombre: string;
  apellido: string;
  documento: string;
  direccion?: string;
}

app.get('/api/personas', async (_req: Request, res: Response) => {
  const personas = await prisma.persona.findMany();
  res.json(personas);
});

app.get('/api/personas/:id', async (req: Request, res: Response) => {
  const id = parseInt(req.params.id as string);
  const persona = await prisma.persona.findUnique({ where: { id } });
  if (!persona) return res.status(404).json({ error: 'No encontrado' });
  res.json(persona);
});

app.post('/api/personas', async (req: Request, res: Response) => {
  const data: PersonaInput = req.body;
  const persona = await prisma.persona.create({ data });
  res.status(201).json(persona);
});

app.put('/api/personas/:id', async (req: Request, res: Response) => {
  const id = parseInt(req.params.id as string);
  const data: PersonaInput = req.body;
  const persona = await prisma.persona.update({ where: { id }, data });
  res.json(persona);
});

app.patch('/api/personas/:id', async (req: Request, res: Response) => {
  const id = parseInt(req.params.id as string);
  const data = req.body;
  const persona = await prisma.persona.update({ where: { id }, data });
  res.json(persona);
});

app.delete('/api/personas/:id', async (req: Request, res: Response) => {
  const id = parseInt(req.params.id as string);
  await prisma.persona.delete({ where: { id } });
  res.status(204).send();
});

app.use((err: Error, _req: Request, res: Response, _next: NextFunction) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Error interno' });
});

app.listen(port, () => {
  console.log(`Servidor ejecutándose en http://localhost:${port}`);
});
