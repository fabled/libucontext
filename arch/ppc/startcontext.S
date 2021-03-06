/*
 * Copyright (c) 2018 William Pitcock <nenolod@dereferenced.org>
 *
 * Permission to use, copy, modify, and/or distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * This software is provided 'as is' and without any warranty, express or
 * implied.  In no event shall the authors be liable for any damages arising
 * from the use of this software.
 */

.globl __start_context;
__start_context:
	/* get the proper context into position and test for NULL */
	mr.	3,31

	/* if we have no linked context, lets get out of here */
	beq	no_linked_context

	/* jump to setcontext */
	bl	__setcontext@local

no_linked_context:
	b	exit@GOT
