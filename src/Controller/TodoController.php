<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Todo;

class TodoController extends AbstractController
{
    #[Route('/', name: 'default')]
    public function index(EntityManagerInterface $entityManager): JsonResponse
    {
        $todos = $entityManager->getRepository(
            Todo::class
        )->findAll();

        return $this->json(['todos' => $todos]);
    }
}
