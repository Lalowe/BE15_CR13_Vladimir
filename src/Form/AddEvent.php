<?php

namespace App\Form;

use App\Entity\BigEvents;

use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\DecimalType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Validator\Constraints\File;
use Symfony\Component\Form\Extension\Core\Type\FileType;


class AddEvent extends AbstractType
{
  public function buildForm(FormBuilderInterface $builder , array $options): void
  {
      $builder
          ->add('name', TextType::class, [
              'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
          ])
          ->add('date', DateTimeType::class, [
            'attr' => ['style' => 'margin-bottom:15px']
        ])
        ->add('description', TextType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])

        ->add('picture', FileType::class, [
            'label' => 'Upload Picture',
//unmapped means that is not associated to any entity property
            'mapped' => false,
//not mandatory to have a file
            'required' => false,

//in the associated entity, so you can use the PHP constraint classes as validators
            'constraints' => [
                new File([
                    'maxSize' => '5048k', // 14
                    'mimeTypes' => [
                        'image/png',
                        'image/jpeg',
                        'image/jpg',
                        'image/webp',
                    ],
                    'mimeTypesMessage' => 'Please upload a valid image file',
                ])
            ],
        ])

          ->add('capacity', IntegerType::class, [
              'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
          ])
          ->add('email', TextType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])
        ->add('phone', IntegerType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])
        ->add('adress', TextType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])
        ->add('url', TextType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])
        // ->add('type', TextType::class, [
        //     'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        // ])
        ->add('type', ChoiceType::class, [
            'choices' => ['music' => 'music', 'movie' => 'movie', 'theater' => 'theater'],
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])

        ->add('lat', TextType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])
        ->add('lon', TextType::class, [
            'attr' => ['class' => 'form-control', 'style' => 'margin-bottom:15px']
        ])
          ->add('save', SubmitType::class, [
              'label' => 'Create AddEvent',
              'attr' => ['class' => 'btn-primary', 'style' => 'margin-bottom:15px']
          ]);
  }

  public function configureOptions(OptionsResolver $resolver): void
  {
      $resolver->setDefaults([
          'data_class' => BigEvents::class,
      ]);
  }
}