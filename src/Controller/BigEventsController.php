<?php

namespace App\Controller;
use Doctrine\Persistence\ManagerRegistry;
use App\Form\AddEvent;
use App\Service\FileUploader;
use Symfony\Component\HttpFoundation\Request;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\BigEvents;


class BigEventsController extends AbstractController
{
    #[Route('/', name: 'big_events')]
  public function index(ManagerRegistry $doctrine): Response
  {
    
    $events = $doctrine->getRepository(BigEvents::class)->findAll();
    
      return $this->render('big_events/index.html.twig', ['events' => $events]); 
      // 'events' come from loop index..
  }
  
  //create
  #[Route('/create', name: 'big_events_create')]
  public function create(Request $request, ManagerRegistry $doctrine, FileUploader $fileUploader): Response
  {
    //   return $this->render('big_events/create.html.twig');
  
       $event = new BigEvents();
       $form = $this->createForm(AddEvent::class, $event);
       $form->handleRequest($request);

       if ($form->isSubmitted() && $form->isValid()) {
        $pictureFile = $form->get('picture')->getData();
        if ($pictureFile) {
          $pictureFileName = $fileUploader->upload($pictureFile);
          $event->setPicture($pictureFileName);
        }
           $event = $form->getData();
           $em = $doctrine->getManager();
           $em->persist($event);
           $em->flush();

           $this->addFlash(
               'notice',
               'BigEvents Added'
               );
           return $this->redirectToRoute('big_events');
       }

       return $this->render('big_events/create.html.twig', ['form' => $form->createView()]);
   }




//edit
  #[Route('/edit/{id}', name: 'big_events_edit')]
  public function edit(Request $request, ManagerRegistry $doctrine, $id , FileUploader $fileUploader): Response
  {
    $event = $doctrine->getRepository(BigEvents::class)->find($id);
    $form = $this->createForm(AddEvent::class, $event);
    $form->handleRequest($request);
    if ($form->isSubmitted() && $form->isValid()) {
      $pictureFile = $form->get('picture')->getData();
      if ($pictureFile) {
        $pictureFileName = $fileUploader->upload($pictureFile);
        $event->setPicture($pictureFileName);
      }
        $event = $form->getData();
        $em = $doctrine->getManager();
        $em->persist($event);
        $em->flush();
        $this->addFlash(
            'notice',
            'BigEvents Added'
            );
        return $this->redirectToRoute('big_events');

    }

    return $this->render('big_events/edit.html.twig', ['form' => $form->createView()]);
}


//details
  #[Route('/details/{id}', name: 'big_events_details')]
  public function details(ManagerRegistry $doctrine, $id): Response
  {
    $event = $doctrine->getRepository(BigEvents::class)->find($id);
      return $this->render('big_events/details.html.twig', ['event' => $event]);
      
  }

//delete
  #[Route('/delete/{id}', name: 'big_events_delete')]
 
  public function delete(ManagerRegistry $doctrine, $id): Response
  {
      $em = $doctrine->getManager();
    $event = $em->getRepository('App:BigEvents')->find($id);
    $em->remove($event);
    
    $em->flush();
    $this->addFlash(
        'notice',
        'event Removed'
    );  
    return $this->redirectToRoute('big_events');
}
}

  