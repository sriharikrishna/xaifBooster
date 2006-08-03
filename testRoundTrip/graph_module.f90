! ========== begin copyright notice ==============
! This file is part of
! ---------------
! xaifBooster
! ---------------
! Distributed under the BSD license as follows:
! Copyright (c) 2005, The University of Chicago
! All rights reserved.
!
! Redistribution and use in source and binary forms,
! with or without modification, are permitted provided that the following conditions are met:
!
!    - Redistributions of source code must retain the above copyright notice,
!      this list of conditions and the following disclaimer.
!    - Redistributions in binary form must reproduce the above copyright notice,
!      this list of conditions and the following disclaimer in the documentation
!      and/or other materials provided with the distribution.
!    - Neither the name of The University of Chicago nor the names of its contributors
!      may be used to endorse or promote products derived from this software without
!      specific prior written permission.
!
! THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
! EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
! OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
! SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
! INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
! PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
! INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
! LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
! OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
!
! General Information:
! xaifBooster is intended for the transformation of
! numerical programs represented as xml files according
! to the XAIF schema. It is part of the OpenAD framework.
! The main application is automatic
! differentiation, i.e. the generation of code for
! the computation of derivatives.
! The following people are the principal authors of the
! current version:
!       Uwe Naumann
!       Jean Utke
! Additional contributors are:
!       Andrew Lyons
!       Peter Fine
!
! For more details about xaifBooster and its use in OpenAD please visit:
!   http://www.mcs.anl.gov/openad
!
! This work is partially supported by:
!       NSF-ITR grant OCE-0205590
! ========== end copyright notice ==============

      module graph_module
        
        use w2f__types
        implicit none
        
        public
        type vertex
          character (len = 40) :: value = ''
          type (list), pointer :: first => NULL()
        end type vertex

        type list
          type (vertex), pointer :: called => NULL()
          type (list), pointer :: next => NULL()
        end type list

        public :: tree, cur
        type (vertex),save:: tree
        type (list), pointer :: cur => NULL()
         
        integer iaddr
        external iaddr
         
        interface makelink
          module procedure makelinks
        end interface

        interface printing
          module procedure graphprint
        end interface

        contains

        subroutine makelinks(srname, prev2)
            character(*) :: srname
            type (list), pointer :: prev2
            type (list), pointer :: newli, newli2
            type (vertex), pointer :: newel
 
            if (tree%value.eq.'') then
              tree%value = srname
              allocate(newli)
              tree%first => newli
              cur => newli
!              print *,iaddr(cur), 'top list'
!              print *,iaddr(cur%called), 'called' !%value
              
            else 
              if(.not. associated(cur%called)) then
                prev2 => cur
                allocate(newel)
                allocate(newli)
!                print *,iaddr(cur%called), 'called' !%value
                
                cur%called => newel
!                print *,iaddr(cur%called), 'called'
                
                newel%first => newli
                cur => newli
                newel%value = srname
!                print *, iaddr(cur), 'list start'!%value
!                print *,iaddr(prev2%called), 'called'
                
              else
                    allocate(newel)
                    allocate(newli)
                    allocate(newli2)
!                    print *,iaddr(cur), 'loc' !%value
                    
                    cur%next => newli
                    newli%called => newel
                    newel%value = srname

                    cur=> newli
                    prev2 => cur
                    newel%first => newli2
                    cur => newli2
!                    print *,iaddr(cur%called), 'called'

!                   print *,iaddr(cur), 'location of next list element'!%value
                    
              end if              
            end if


        end subroutine makelinks

        recursive subroutine graphprint(invertex)
          type (vertex) :: invertex
          integer five
          type (list), pointer :: itr 
          if(associated(invertex%first%next)) then
            itr => invertex%first
            do 100
              write(10,'(I12,A9,A10,A3)')iaddr(itr%called), '[label="',&
       itr%called%value,'"];'
              write (10,'(I12, A2,I12, A2)') iaddr(invertex), '->',&
       iaddr(itr%called), ' ;' 
              call graphprint(itr%called)
              if(associated (itr%next)) then
                itr => itr%next
             else
                exit
              end if
            100 continue
          else
            if(associated(invertex%first%called)) then
              write(10,'(I12,A9,A10,A3)')iaddr(invertex%first%called),&
       ' [label="', invertex%first%called%value,'"];'
              write (10,'(I12, A2,I12, A2)') iaddr(invertex), '->',&
       iaddr(invertex%first%called), ' ;' 
               call graphprint(invertex%first%called)
            endif
          end if
        end subroutine graphprint


      end module graph_module
